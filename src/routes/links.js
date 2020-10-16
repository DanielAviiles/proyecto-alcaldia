const express = require('express');
const router = express.Router();
const pool = require('../database');

/* CONFIGURACION RUTAS FORMULARIOHVE. START */
  router.get('/formulariohve', async (req, res) => {
    const secretaria = await pool.query(`SELECT * FROM secretaria`);
    const dependencia = await pool.query(`SELECT * FROM dependencia`);
    const cargo = await pool.query(`SELECT * FROM cargo`);
    const area = await pool.query(`SELECT * FROM area_trabajo`);
    const empresa = await pool.query(`SELECT * FROM empresa_proveedor`);
    const tipo_ordenador = await pool.query(`SELECT * FROM tipo_equipo`);
    const marcaOrdenador = await pool.query(`SELECT * FROM marca_pc`);
    const tipo_monitor = await pool.query(`SELECT * FROM tipo_monitor`);
    const tipo_impresora = await pool.query(`SELECT * FROM tipo_impresora`);
    const usuario = await pool.query(`SELECT id, nombre_completo FROM usuario`);

    res.render('links/formHVE', {
      titleForm: 'HOJA DE VIDA DEL EQUIPO',
      secretaria, dependencia, cargo, area, empresa,
      tipo_ordenador,marcaOrdenador, tipo_monitor, tipo_impresora, usuario
    });
  });
  /* CONSULTAS AJAX PARA FORMULARIOHVE. START */
    router.get('/formulariohve/informcionEquipo', async (req, res) => {
      const tipo_disco = await pool.query(`SELECT * FROM tipo_disco`);
      const procesador = await pool.query(`SELECT * FROM marca_procesador`);
      const tipo_ram = await pool.query(`SELECT * FROM tipo_ram`);
      res.json({ typeDisk: tipo_disco, typeRam: tipo_ram, marcacpu: procesador });
    });
    router.get('/formulariohve/method-compra', async (req, res) => {
      const tipo_compra = await pool.query(`SELECT * FROM tipo_compra`);
      res.json({ pagos: tipo_compra });
    });
    router.post('/formulariohve/obtener-nit', async (req, res) => {
      const {empresa_id} = req.body;
      const nitEmpresa = await pool.query(`SELECT nit FROM empresa_proveedor WHERE id = ${empresa_id}`);
      res.json({ resp: nitEmpresa });
    });
  /* CONSULTAS AJAX PARA FORMULARIOHVE. END */

  router.post('/formulariohve', async(req, res) => {
    const body = req.body;
    console.log('Cuerpo del formulario: ', body);
    const newEquipo = {
      codigo_equipo: body.codigoHVE,
      registro: body.registroHVE,
      usuario_id: body.resposableHVE,
      secretaria_id: body.secretariaHVE,
      area_trabajo_id: body.ubicacionHVE,
      tipo_compra_id: body.tipoCompraHVE.length ? body.tipoCompraHVE : null,
      forma_adquision_id: body.formaAdquisicionHVE
    };

    await pool.query('INSERT INTO equipo SET ?', [newEquipo]);
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