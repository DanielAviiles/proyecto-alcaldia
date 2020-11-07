const listEquiposModel = require('../models/listEquiposModel');

async function mostrarInfoEquipos() {
  return await listEquiposModel.dataOrdenadores();
}

module.exports = {
  mostrarInfoEquipos
};