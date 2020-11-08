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

async function listarSecretariaComplementos() { return await formHVEModel.showSecretariaComplementos(); }
async function insertarCargo(req) {
  let { nombreModelRegistro } = req.body;
  return await formHVEModel.insertCargo(nombreModelRegistro);
}
async function insertarDependencia(req) {
  let { nombreModelRegistro } = req.body;
  return await formHVEModel.insertDependencia(nombreModelRegistro);
}
async function insertarAreaT(req) {
  let { nombreModelRegistro } = req.body;
  return await formHVEModel.insertAreaT(nombreModelRegistro);
}

async function insertarEmpresa(req) {
  const {nombreModalEmpresa, nitEmpresa} = req.body;
  const infoEmpresa = {
    nombre: nombreModalEmpresa,
    nit: nitEmpresa
  }
  await formHVEModel.insertEmpresaProveedor(infoEmpresa);
}
async function insertarSecretaria(req) {
  const {nombreModelRegistro, optDependencia} = req.body;
  const infoSecretaria = {
    nombre: nombreModalSecretaria,
    dependencia_id: optDependencia
  }
  await formHVEModel.insertSecretaria(infoSecretaria);
}

async function modificarCargo(req, idCargo) {
  const {nombreModelRegistro} = req.body;
  const updateCargo = {
    nombre: nombreModelRegistro
  }
  await formHVEModel.modifyCargo(updateCargo, idCargo);
}
async function modificarDependencia(req, idDependencia) {
  const {nombreModelRegistro} = req.body;
  const updateDependencia = {
    nombre: nombreModelRegistro
  }
  await formHVEModel.modifyDependencia(updateDependencia, idDependencia);
}
async function modificarAreaT(req, idAreaT) {
  const {nombreModelRegistro} = req.body;
  const updateAreaT = {
    nombre: nombreModelRegistro
  }
  await formHVEModel.modifyAreaT(updateAreaT, idAreaT);
}

async function modificarEmpresaProveedor(req, idEmpresa) {
  const { nombreModalEmpresa, nitEmpresa } = req.body;
  const updateEmpresa = {
    nombre: nombreModalEmpresa,
    nit: nitEmpresa
  }
  await formHVEModel.modifyEmpresaProveedor(updateEmpresa, idEmpresa);
}
async function modificarSecretaria(req, idSecretaria) {
  const {nombreModalSecretaria, optDependencia} = req.body;
  const updateSecretaria = {
    nombre: nombreModalSecretaria,
    dependencia_id: optDependencia
  }
  await formHVEModel.modifySecretaria(updateSecretaria, idSecretaria);
}

async function eliminarCargo(idCargo) { await formHVEModel.deleteCargo(idCargo); }
async function eliminarDependencia(idDependencia) { await formHVEModel.deleteDependencia(idDependencia); }
async function eliminarAreaT(idAreaT) { await formHVEModel.deleteAreaT(idAreaT); }

async function eliminarEmpresa(idEmpresa) { await formHVEModel.deleteEmpresa(idEmpresa); }
async function eliminarSecretaria(idSecretaria) { await formHVEModel.deleteSecretaria(idSecretaria); }

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
  listarSecretariaComplementos,
  insertarCargo,
  insertarDependencia,
  insertarAreaT,
  insertarEmpresa,
  insertarSecretaria,
  modificarCargo,
  modificarDependencia,
  modificarAreaT,
  modificarEmpresaProveedor,
  modificarSecretaria,
  eliminarCargo,
  eliminarDependencia,
  eliminarAreaT,
  eliminarEmpresa,
  eliminarSecretaria,
};