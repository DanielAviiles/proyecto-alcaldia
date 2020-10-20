function obtenerNit() {
  if ($("select[name=empresaProveedorHVE]").val()) {
    $.ajax({
      url: "/formulariohve/obtener-nit",
      method: "POST",
      data: {
        empresa_id: $("select[name=empresaProveedorHVE]").val()
      },
      dataType: "json"
    }).done(msg => {
      $("#nitEmpresaProveedor").val(msg.resp[0].nit)
    })
  }
}

function listarMethodPagos() {
  $.ajax({
    url: "/formulariohve/method-compra",
    method: "GET",
    dataType: "json"
  }).done(msg => {
    console.log('Data method pagos: ', msg.pagos);
    msg.pagos.forEach(element => {
      methodCompra = `<option value="${element.id}">${element.nombre}</option>`
      $("select[name=tipoCompraHVE]").append(methodCompra);
    });
  });
}


$(document).ready(function () {
  contenidoCompra = `<div id="compraChecked" class="row mt-2">
                      <label for="" class="col-sm-5 col-lg-2 col-form-label txt-small">TIPO DE COMPRA:</label>
                      <div class="col-sm-2" id="selectTipoCompra">
                        <select name="tipoCompraHVE" class="custom-select mr-sm-2">
                          <option selected disabled>Seleccione...</option>
                        </select>
                      </div>
                      <label for="" class="col-sm-5 col-lg-2 col-form-label txt-small">NUMERO DEL PROCESO:</label>
                      <div class="col-sm-2">
                        <input type="text" class="form-control" name="numeroProcesoHVE">
                      </div>
                      <label for="" class="col-sm-5 col-lg-2 col-form-label txt-small">VALOR DEL PROCESO:</label>
                      <div class="col-sm-2">
                        <input type="text" class="form-control" name="valorProcesoHVE">
                      </div>
                    </div>`;
  contenidoComodato = `<div id="comodatoChecked" class="form-row col-md-12 p-0">
                        <label for="" class="col-md-5 col-lg-2 col-form-label" >NUMERO DEL PROCESO:</label>
                        <div class="col-md-10">
                          <input type="text" class="form-control mt-2" name="numeroProcesoHVE">
                        </div>
                      </div>`;

  contenidoEstadoEquipo = `<div class="row mt-2" id="fechaBajaHVE">
                            <label class="col-sm-3 col-form-label">FECHA DE LA BAJA:</label>
                            <div class="col-sm-9">
                              <input type="date" class="form-control" name="fechaBajaHVE">
                            </div>
                          </div>
                          <div class="row mt-2" id="descripcionBajaHVE">
                            <label for="" class="col-sm-3 col-form-label">MOTIVO DE LA BAJA:</label>
                            <div class="col-sm-9">
                              <textarea class="form-control" aria-label="With textarea" name="motivoBajaHVE"></textarea>
                            </div>
                          </div>`;

  $("input[name=formAdquisicionHVE]:radio").change(function () {
    if ($(this).val() == 1) {
      $("#comodatoChecked").remove();
      $("#contenidoAdquisicion").append(contenidoCompra);
      listarMethodPagos();
    } else if ($(this).val() == 3) {
      $("#compraChecked").remove();
      $("#contenidoAdquisicion").append(contenidoComodato);
    } else {
      $("#compraChecked").remove();
      $("#comodatoChecked").remove();
    }
  });

  let iteradorChck = 0;
  $("input[name=unidadlectoraHVE]:checkbox").change(function () {
    iteradorChck++;
    if (iteradorChck % 2) {
      $(this).val("1");
      $("#dvdInput").removeAttr("disabled");
      $("#dvdInput").focus();
    } else {
      $(this).val("0")
      $("#dvdInput").val("");
      $("#dvdInput").prop("disabled", true);
    }
  });

  let iteradorChckEstabilidaor=0
  $("input[name=estabilizadorHVE]:checkbox").change(function () {
    iteradorChckEstabilidaor++;
    if (iteradorChckEstabilidaor % 2) {
      $(this).val("1");
    } else {
      $(this).val("0")
    }
  });

  let iteradorChckUPS=0
  $("input[name=upsHVE]:checkbox").change(function () {
    iteradorChckUPS++;
    if (iteradorChckUPS % 2) {
      $(this).val("1");
    } else {
      $(this).val("0")
    }
  });

  $("input[name=estadoEquipoHVE]:radio").change(function () {
    if ($(this).val() == 4) {
      $("#controlBajaHVE").append(contenidoEstadoEquipo);
    } else {
      $("#fechaBajaHVE").remove();
      $("#descripcionBajaHVE").remove();
    }
  });

  $("select[name=empresaProveedorHVE]").change(() => obtenerNit());
  
  $("select[name=escanerAsignadoHVE]").change(function () {
    if ($(this).val() == 1) {
      $("input[name=marcaEscanerHVE]").removeAttr("disabled");
      $("input[name=serialEscanerHVE]").removeAttr("disabled");
      $("input[name=numInvEscanerHVE]").removeAttr("disabled");
    } else {
      $("input[name=marcaEscanerHVE]").prop("disabled", true);
      $("input[name=serialEscanerHVE]").prop("disabled", true);
      $("input[name=numInvEscanerHVE]").prop("disabled", true);
    }
  });

});