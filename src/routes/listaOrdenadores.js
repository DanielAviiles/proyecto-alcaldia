const express = require('express');
const router = express.Router();
const infoEquiposController = require('../controllers/listEquiposController');

router.get('/lista-ordenadores', (req, res) => {
  res.render('ordenadores/ordenadoresList', {tituloTable: 'LISTA DE ORDENADORES'});
});

router.get('/info-ordenadores', async(req, res) => {
  const dataEquipos = await infoEquiposController.mostrarInfoEquipos();
  res.json({ data: dataEquipos });
});

module.exports = router;