const express = require('express');
const router = express.Router();
const formHVEController = require('../controllers/formHVEController');

/* CONFIGURACION RUTAS FORMULARIOHVE. START */
  router.get('/formulariohve', async (req, res) => {
    const secretaria = await formHVEController.listarSecretaria();
    const dependencia = await formHVEController.listarDependencia();
    const cargo = await formHVEController.listarCargo();
    const area = await formHVEController.listarAreaTrabajo();
    const empresa = await formHVEController.listarEmpresaProveedor();
    const tipo_ordenador = await formHVEController.listarTipoEquipo();
    const marcaOrdenador = await formHVEController.listarMarcaPc();
    const tipo_monitor = await formHVEController.listarTipoMonitor();
    const tipo_impresora = await formHVEController.listarTipoImpresora();
    const usuario = await formHVEController.listarUsuario();

    res.render('links/formHVE', {
      titleForm: 'HOJA DE VIDA DEL EQUIPO',
      secretaria, dependencia, cargo, area, empresa,
      tipo_ordenador,marcaOrdenador, tipo_monitor, tipo_impresora, usuario
    });
  });
  
  /* CONSULTAS AJAX PARA FORMULARIOHVE. START */
    router.get('/formulariohve/informcionEquipo', async (req, res) => {
      const marcaDisco = await formHVEController.listarMarcaDisco();
      const tipo_disco = await formHVEController.listarTipoDisco();
      const procesador = await formHVEController.listarProcesador();
      const tipo_ram = await formHVEController.listarTipoRam();
      const ram = await formHVEController.listarRam();

      res.json({
        marcadisco: marcaDisco,
        typeDisk: tipo_disco,
        typeRam: tipo_ram,
        marcacpu: procesador,
        marcaram: ram
      });
    });
    router.get('/formulariohve/method-compra', async (req, res) => {
      const tipo_compra = await formHVEController.listarTipoCompra();
      res.json({ pagos: tipo_compra });
    });
    router.post('/formulariohve/obtener-nit', async (req, res) => {
      const nitEmpresa = await formHVEController.listarInfoEmpresaProveedor(req);
      res.json({ resp: nitEmpresa });
    });
  /* CONSULTAS AJAX PARA FORMULARIOHVE. END */

  router.post('/formulariohve', async(req, res) => {
    await formHVEController.addEquipoHVE(req);
    res.redirect('/home');
  });
/* CONFIGURACION RUTAS FORMULARIOHVE. END */

router.get('/formulariomde', (req, res) => {
  res.render('links/formMDE', {titleForm: 'MANTENIMIENTO DE EQUIPOS'});
});

router.get('/formulariofte', (req, res) => {
  res.render('links/formFTE', {titleForm: 'FICHA TECNICA DEL EQUIPO'});
});

router.get('/formulariofre', (req, res) => {
  res.render('links/formFRE', {titleForm: 'FICHA DE REVISION DE EQUIPOS'});
});

module.exports = router;