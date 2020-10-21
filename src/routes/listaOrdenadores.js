const express = require('express');
const router = express.Router();
const pool = require('../database');

router.get('/lista-ordenadores', (req, res) => {
  res.render('ordenadores/ordenadoresList', {tituloTable: 'LISTA DE ORDENADORES'});
});

router.get('/info-ordenadores', async(req, res) => {
  const infoOrdenadoresFull = await pool.query(`SELECT 
                                                  equipo.codigo,
                                                  equipo.fecha_adquision
                                                FROM
                                                  equipo`);

  res.json({ infoOrdenadoresFull });
});

module.exports = router;