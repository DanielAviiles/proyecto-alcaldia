const pool = require('../database');

async function showSecretaria() { return await pool.query('SELECT * FROM secretaria');}
async function showDependencia() { return await pool.query('SELECT * FROM dependencia');}
async function showCargo() { return await pool.query('SELECT * FROM cargo');}
async function showAreaTrabajo() { return await pool.query('SELECT * FROM area_trabajo'); }
async function showEmpresaProveedor() { return await pool.query('SELECT * FROM empresa_proveedor'); }
async function showTipoEquipo() { return await pool.query('SELECT * FROM tipo_equipo'); }
async function showMarcaPc() { return await pool.query('SELECT * FROM marca_pc'); }
async function showTipoMonitor() { return await pool.query('SELECT * FROM tipo_monitor'); }
async function showTipoImpresora() { return await pool.query('SELECT * FROM tipo_impresora'); }
async function showUsuario() { return await pool.query('SELECT id, nombre_completo FROM usuario'); }

async function showSecretariaComplementos() {
  return await pool.query(`SELECT 
                            secretaria.id,
                            secretaria.nombre nameSecretaria,
                            dependencia.nombre nameDependencia 
                          FROM
                            secretaria,
                            dependencia
                          WHERE secretaria.dependencia_id = dependencia.id`);
}
async function insertCargo(nombreCargo) {
  const infoCargo = { nombre: nombreCargo };
  return await pool.query('INSERT INTO cargo SET ?', [infoCargo]);
}
async function insertDependencia(nombreDependencia) {
  const infoDependencia = { nombre: nombreDependencia };
  return await pool.query('INSERT INTO dependencia SET ?', [infoDependencia]);
}
async function insertAreaT(nombreAreaT) {
  const infoAreaT = { nombre: nombreAreaT };
  return await pool.query('INSERT INTO area_trabajo SET ?', [infoAreaT]);
}

async function insertEmpresaProveedor(infoEmpresa) { await pool.query('INSERT INTO empresa_proveedor SET ?', [infoEmpresa]); }
async function insertSecretaria(infoSecretaria) { await pool.query('INSERT INTO secretaria SET ?', [infoSecretaria]); }

async function modifyCargo(infoCargo, idcargo) {await pool.query('UPDATE cargo SET ? WHERE id=?', [infoCargo, idcargo])}
async function modifyDependencia(infoDependencia, idDependencia) {
  await pool.query('UPDATE dependencia SET ? WHERE id=?', [infoDependencia, idDependencia])
}
async function modifyAreaT(infoAreaT, idAreaT) { await pool.query('UPDATE area_trabajo SET ? WHERE id=?', [infoAreaT, idAreaT]) }

async function modifyEmpresaProveedor(infoEmpresa, idEmpresa) {
  await pool.query('UPDATE empresa_proveedor SET ? WHERE id=?', [infoEmpresa, idEmpresa]);
}
async function modifySecretaria(infoSecretaria, idSecretaria) {
  await pool.query('UPDATE secretaria SET ? WHERE id=?', [infoSecretaria, idSecretaria]);
}

// CONFIG AJAX REQUEST. START
async function showMarcaDisco(){return await pool.query('SELECT * FROM marca_disco');}
async function showTipoDisco(){return await pool.query('SELECT * FROM tipo_disco');}
async function showProcesador(){return await pool.query('SELECT * FROM marca_procesador');}
async function showTipoRam(){return await pool.query('SELECT * FROM tipo_ram');}
async function showRam() { return await pool.query('SELECT * FROM marca_ram'); }
async function showTipoCompra() { return await pool.query('SELECT * FROM tipo_compra'); }
async function showInfoEmpresaProveedor(empresa_id) {
  return await pool.query(`SELECT nit FROM empresa_proveedor WHERE id = ${empresa_id}`);
}
// CONFIG AJAX REQUEST. END

// INSERT FOMRHVE
async function insertEquipoHVE(body) {
  const referencia_equipo = {
    modelo_pc: body.modeloCpuHVE,
    serial_pc: body.serialCpuHVE,
    marca_pc_id: body.marcaCpuHVE,
  }
  await pool.query('INSERT INTO referencia SET ?', [referencia_equipo]);
  const ref_ordenador = await pool.query('SELECT LAST_INSERT_ID() idRefOrdenador');
  let idOrdenador = Object.values(JSON.parse(JSON.stringify(ref_ordenador)));

  const insertRamHVE = {
    frecuencia: body.frecuenciaRAMHVE,
    cantidad: body.cantidadRAMHVE,
    marca_id: body.nombreRAMHVE,
    tipo_ram_id: body.tipoRAMHVE
  }
  await pool.query('INSERT INTO ram SET ?', [insertRamHVE]);
  const RAMHHVE = await pool.query('SELECT LAST_INSERT_ID() idRAMinsert');
  let idRAMHVE = Object.values(JSON.parse(JSON.stringify(RAMHHVE)));

  const insertCPUHVE = {
    frecuencia: body.frecuenciaCPUHVE,
    marca_procesador_id: body.marcaCPUHVE
  }
  await pool.query('INSERT INTO procesador SET ?', [insertCPUHVE]);
  const CPUHVE = await pool.query('SELECT LAST_INSERT_ID() idCPUinsert');
  let idCPUHVE = Object.values(JSON.parse(JSON.stringify(CPUHVE)));

  // Configuracion para perifericos HVE - INICIO
    const refTeclado = {
      nombre: body.marcaTecladoHVE,
      tipo_entrada: body.conexionTecladoHVE
    }
    await pool.query('INSERT INTO marca_teclado SET ?', [refTeclado]);
    const tecladoHVE = await pool.query('SELECT LAST_INSERT_ID() idTecladoInsert');
    let idTecladoHVE = Object.values(JSON.parse(JSON.stringify(tecladoHVE)));

    const refMouse = {
      nombre: body.marcaMouseHVE,
      tipo_entrada: body.conexionMouseHVE
    }
    await pool.query('INSERT INTO marca_mouse SET ?', [refMouse]);
    const mouseHVE = await pool.query('SELECT LAST_INSERT_ID() idMouseInsert');
    let idMouseHVE = Object.values(JSON.parse(JSON.stringify(mouseHVE)));

    let marcaDVDHVE = 0; let idMarcaDVD = 0;
  if (body.unidadlectoraHVE == 1) {
      const newLectorDVD = {
        nombre: body.lectorDVDCD
      }
      await pool.query('INSERT INTO marca_dvd SET ?', [newLectorDVD])
      marcaDVDHVE = await pool.query('SELECT LAST_INSERT_ID() idMarcaDVDHVE');
      idMarcaDVD = Object.values(JSON.parse(JSON.stringify(marcaDVDHVE)));
    }

    const insertInfoPerifericos = {
      lector_tarjeta: body.lectorTarjetasHVE,
      tarjeta_video: body.tajetaVideoHVE,
      unidad_quemadora: body.unidadQuemadoraHVE,
      estabilizador: body.estabilizadorHVE ? body.estabilizadorHVE : 0,
      ups: body.upsHVE ? body.upsHVE : 0,
      marca_teclado_id: idTecladoHVE[0].idTecladoInsert,
      marca_dvd_id: idMarcaDVD!=0 ? idMarcaDVD[0].idMarcaDVDHVE : null,
      marca_mouse_id: idMouseHVE[0].idMouseInsert
    }
    await pool.query('INSERT INTO perifericos SET ?', [insertInfoPerifericos]);
    const refPerifericos = await pool.query('SELECT LAST_INSERT_ID() perifericosInsert');
    let idPerifericosHVE = Object.values(JSON.parse(JSON.stringify(refPerifericos)));
  // Configuracion para perifericos HVE - FIN

  const formaAdquisicion = {
    nProceso: body.numeroProcesoHVE ? body.numeroProcesoHVE : null,
    vProceso: body.valorProcesoHVE ? body.valorProcesoHVE : null,
    tipo_adquisicion_id: body.formAdquisicionHVE
  }
  await pool.query('INSERT INTO forma_adquision SET ?', [formaAdquisicion]);
  const refFormaAdquisicion = await pool.query('SELECT LAST_INSERT_ID() formaAdquisicionInsert');
  let idFormaAdquisicion = Object.values(JSON.parse(JSON.stringify(refFormaAdquisicion)));

  let refEscaner = 0; let idEscaner = 0;
  if (body.escanerAsignadoHVE == 1) {
    const infoEscaner = {
      marca_escaner: body.marcaEscanerHVE,
      serial: body.serialEscanerHVE,
      num_inv: body.numInvEscanerHVE
    }
    await pool.query('INSERT INTO escaner SET ?', [infoEscaner]);
    refEscaner = await pool.query('SELECT LAST_INSERT_ID() escarnerInsert');
    idEscaner = Object.values(JSON.parse(JSON.stringify(refEscaner)));
  }

  const infoImpresora = {
    marca_impresora: body.marcaImpresoraHVE,
    serial: body.serialImprHVE,
    num_inv: body.numInvImprHVE,
    tipo_conexion: body.tipoConexionImprHVE,
    tipo_impresora_id: body.tipoImprHVE
  }
  await pool.query('INSERT INTO impresora SET ?', [infoImpresora]);
  const refImpresora = await pool.query('SELECT LAST_INSERT_ID() impresoraInsert');
  let idImpresora = Object.values(JSON.parse(JSON.stringify(refImpresora)));

  const infoMonitor = {
    marca: body.marcaMonitHVE,
    modelo: body.modeloMonitHVE,
    serial: body.serialMonitHVE,
    num_inventario: body.numInvMonitHVE,
    tipo_monitor_id: body.tipoMonitHVE
  }
  await pool.query('INSERT INTO monitor SET ?', [infoMonitor]);
  const refMonitor = await pool.query('SELECT LAST_INSERT_ID() monitorInsert');
  let idMonitor = Object.values(JSON.parse(JSON.stringify(refMonitor)));

  const newEquipo = {
    codigo_equipo: body.codigoHVE,
    registro: body.registroHVE,
    fecha_adquision: body.fechaAdquisicionHVE,
    fecha_instalacion: body.fechaInstalacionHVE,
    fecha_funcionamiento: body.fechaFuncionamientoHVE,
    objeto_contrato: body.objetoContratoHVE,
    num_inventario: body.numEquipoHVE,
    fecha_garantia_inicio: body.fechaInicioHVE,
    fecha_garantia_fin: body.fechaFinHVE,
    n_pci: body.numPuertosPciHVE,
    n_usb: body.numPuertosUsbHVE,
    vga: body.puertoVgaHVE,
    hdmi: body.puertoHdmiHVE,
    rj45: body.puertoRj45HVE,
    wifi: body.puertoWifiHVE,
    n_disipadores: body.numDisipadoresHVE,
    fecha_baja: body.fechaBajaHVE ? body.fechaBajaHVE : null,
    motivo_baja: body.motivoBajaHVE ? body.motivoBajaHVE : null,

    usuario_id: body.responsableHVE,
    secretaria_id: body.secretariaHVE,
    area_trabajo_id: body.ubicacionHVE,
    tipo_compra_id: body.tipoCompraHVE ? body.tipoCompraHVE : null,
    tipo_equipo_id: body.tipoEquipoHVE,
    empresa_proveedor_id: body.empresaProveedorHVE,
    referencia_id: idOrdenador[0].idRefOrdenador,
    procesamiento_id: idRAMHVE[0].idRAMinsert,
    perifericos_id: idPerifericosHVE[0].perifericosInsert,
    escaner_id: idEscaner!=0 ? idEscaner[0].escarnerInsert: null,
    impresora_id: idImpresora[0].impresoraInsert,
    monitor_id: idMonitor[0].monitorInsert,
    estado_pc_id: body.estadoEquipoHVE,
    informacion_id: null,
    procesador_id: idCPUHVE[0].idCPUinsert,
    forma_adquision_id: idFormaAdquisicion[0].formaAdquisicionInsert
  };
  await pool.query('INSERT INTO equipo SET ?', [newEquipo]);
  const refEquipo = await pool.query('SELECT LAST_INSERT_ID() idEquipoInsert');
  let idEquipo = Object.values(JSON.parse(JSON.stringify(refEquipo)));

  if (typeof (body.marcaHddHVE) == 'object') {
    let posicion = 0;
    body.marcaHddHVE.forEach(async(item) => {
      await pool.query(`INSERT INTO capacidad (volumen, marca_disco_id, tipo_disco_id, equipo_id) 
                        VALUES (${body.volumenHddHVE[posicion]}, ${item}, ${body.tipoHddHVE[posicion]}, ${idEquipo[0].idEquipoInsert})`);
      posicion++;
    });
  } else {
    const oneDisk = {
      volumen: body.volumenHddHVE,
      marca_disco_id: body.marcaHddHVE,
      tipo_disco_id: body.tipoHddHVE,
      equipo_id: idEquipo[0].idEquipoInsert
    }
    await pool.query('INSERT INTO capacidad SET ?', [oneDisk]);
  }
}

module.exports = {
  showSecretaria,
  showDependencia,
  showCargo,
  showAreaTrabajo,
  showEmpresaProveedor,
  showTipoEquipo,
  showMarcaPc,
  showTipoMonitor,
  showTipoImpresora,
  showUsuario,
  showMarcaDisco,
  showTipoDisco,
  showProcesador,
  showTipoRam,
  showRam,
  showTipoCompra,
  showInfoEmpresaProveedor,
  insertEquipoHVE,
  showSecretariaComplementos,
  insertCargo,
  insertDependencia,
  insertAreaT,
  insertEmpresaProveedor,
  insertSecretaria,
  modifyCargo,
  modifyDependencia,
  modifyAreaT,
  modifyEmpresaProveedor,
  modifySecretaria,
};

