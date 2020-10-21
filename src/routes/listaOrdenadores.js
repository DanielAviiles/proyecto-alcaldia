const express = require('express');
const router = express.Router();
const pool = require('../database');

router.get('/lista-ordenadores', (req, res) => {
  res.render('ordenadores/ordenadoresList', {tituloTable: 'LISTA DE ORDENADORES'});
});

router.get('/info-ordenadores', async(req, res) => {
  const infoEquipos = await pool.query(`SELECT 
                                          equipo.codigo_equipo, tipo_equipo.nombre tipo_equipo, equipo.fecha_adquision,
                                          usuario.nombre_completo, equipo.objeto_contrato,
                                          empresa_proveedor.nombre nombre_empresa, empresa_proveedor.nit,
                                          estado_pc.nombre estado_nombre
                                        FROM
                                          equipo, tipo_equipo, usuario, empresa_proveedor, estado_pc
                                        WHERE
                                          equipo.tipo_equipo_id = tipo_equipo.id AND equipo.usuario_id = usuario.id AND
                                          equipo.empresa_proveedor_id = empresa_proveedor.id AND
                                          equipo.estado_pc_id = estado_pc.id`);

  res.json({ data: infoEquipos });
});

module.exports = router;