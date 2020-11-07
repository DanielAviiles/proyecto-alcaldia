const formHVEModel = require('../models/formHVE_Model');

async function listarSecretaria() { return await formHVEModel.showSecretaria();}
async function listarDependencia() { return await formHVEModel.showDependencia();}
async function listarCargo() { return await formHVEModel.showCargo(); }
async function listarAreaTrabajo() { return await formHVEModel.showAreaTrabajo(); }
async function listarEmpresaProveedor() { return await formHVEModel.showEmpresaProveedor(); }
async function listarTipoEquipo() { return await formHVEModel.showTipoEquipo(); }
async function listarMarcaPc() { return await formHVEModel.showMarcaPc(); }
async function listarTipoMonitor() { return await formHVEModel.showTipoMonitor(); }
async function listarTipoImpresora() { return await formHVEModel.showTipoImpresora(); }
async function listarUsuario() { return await formHVEModel.showUsuario(); }

// CONFIG AJAX REQUEST. START
async function listarMarcaDisco(){ return await formHVEModel.showMarcaDisco() }
async function listarTipoDisco(){ return await formHVEModel.showTipoDisco() }
async function listarProcesador(){ return await formHVEModel.showProcesador() }
async function listarTipoRam(){ return await formHVEModel.showTipoRam() }
async function listarRam(){ return await formHVEModel.showRam() }
async function listarTipoCompra(){ return await formHVEModel.showTipoCompra() }
async function listarInfoEmpresaProveedor(req) {
  const {empresa_id} = req.body;
  return await formHVEModel.showInfoEmpresaProveedor(empresa_id);
}
// CONFIG AJAX REQUEST. END

// Insert Ordenado al HVE
async function addEquipoHVE(req) {
  const body = req.body;
  // console.log('Cuerpo del formulario: ', body);
  await formHVEModel.insertEquipoHVE(body);
}
module.exports = {
  listarSecretaria,
  listarDependencia,
  listarCargo,
  listarAreaTrabajo,
  listarEmpresaProveedor,
  listarTipoEquipo,
  listarMarcaPc,
  listarTipoMonitor,
  listarTipoImpresora,
  listarUsuario,
  listarMarcaDisco,
  listarTipoDisco,
  listarProcesador,
  listarTipoRam,
  listarRam,
  listarTipoCompra,
  listarInfoEmpresaProveedor,
  addEquipoHVE,
};