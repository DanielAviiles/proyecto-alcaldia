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

module.exports = router;