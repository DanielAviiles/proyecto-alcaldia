const express = require('express');
const router = express.Router();
const configController = require('../controllers/formHVEController');

router.get('/informesAdicionales', async (req, res) => {
  const cargos = await configController.listarCargo();
  const dependencias = await configController.listarDependencia();
  const areaTrabajo = await configController.listarAreaTrabajo();
  res.render('registros/registersParaHVE', {
    cargos,
    dependencias,
    areaTrabajo
  });
});

router.post('/informesAdicionales/:seccion', async (req, res) => {
  let { seccion } = req.params;
  if (seccion == 1) {
    await configController.insertarCargo(req);
  } else if (seccion == 2) {
    await configController.insertarDependencia(req);
  } else {
    await configController.insertarAreaT(req);
  }
  res.redirect('/registros/informesAdicionales')
});

router.get('/secundarios', async (req, res) => {
  const empresas = await configController.listarEmpresaProveedor();
  const secretarias = await configController.listarSecretariaComplementos();
  const dependencias = await configController.listarDependencia();

  res.render('registros/otrosRegistros', {
    empresas,
    secretarias,
    dependencias
  });
});

router.post('/secundarios/:seccion', async (req, res) => {
  const { seccion } = req.params;

  if (seccion == 1) {
    await configController.insertarEmpresa(req);
  } else {
    await configController.insertarSecretaria(req);
  }

  res.redirect('/registros/secundarios');
});


router.post('/edit-registros/:idElement/:seccion', async (req, res) => {
  const { idElement, seccion } = req.params;

  if (seccion == 1) {
    await configController.modificarCargo(req, idElement);
  } else if (seccion == 2) {
    await configController.modificarDependencia(req, idElement);
  } else {
    await configController.modificarAreaT(req, idElement);
  }

  res.redirect('/registros/informesAdicionales');
});
module.exports = router;