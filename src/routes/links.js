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
      let infoEquipo = {};
      const marcaDisco = await pool.query(`SELECT * FROM marca_disco`);
      const tipo_disco = await pool.query(`SELECT * FROM tipo_disco`);
      const procesador = await pool.query(`SELECT * FROM marca_procesador`);
      const tipo_ram = await pool.query(`SELECT * FROM tipo_ram`);
      const ram = await pool.query(`SELECT * FROM marca_ram`);
  
      infoEquipo = {
        marcadisco: marcaDisco,
        typeDisk: tipo_disco,
        typeRam: tipo_ram,
        marcacpu: procesador,
        marcaram: ram
      };
      res.json(infoEquipo);
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