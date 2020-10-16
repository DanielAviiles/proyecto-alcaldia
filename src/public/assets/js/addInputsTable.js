function listarTypeDisk() {
  $.ajax({
    url: "/formulariohve/informcionEquipo",
    method: "GET",
    dataType: "json"
  }).done(msg => {
    msg.typeDisk.forEach(element => {
      tipoDisk = `<option value="${element.id}">${element.nombre}</option>`
      $("select[name=tipoHddHVE]").append(tipoDisk);
    });
  });
}

function listarCpuRam() {
  $.ajax({
    url: "/formulariohve/informcionEquipo",
    method: "GET",
    dataType: "json"
  }).done(msg => {
    msg.marcacpu.forEach(element => {
      marcaCPU = `<option value="${element.id}">${element.nombre}</option>`
      $("select[name=nombreProcesador]").append(marcaCPU);
    });
    msg.typeRam.forEach(element => {
      tipoRam = `<option value="${element.id}">${element.nombre}</option>`
      $("select[name=tipoRAM]").append(tipoRam);
    });
  });
}

let nextinputequipo = 0;
function agregarFilaCapacidadEquipo() {
  $("#rowSinRegistro1").remove();
  nextinputequipo++;
  fila = `<tr>
            <th scope="row">${nextinputequipo}</th>
            <td><input type="text" class="form-control" name="marcaHddHVE" aria-describedby="emailHelp"></td>
            <td>
              <select class="form-control" name="tipoHddHVE">
                <option selected disabled>Seleccione...</option>
              </select>
            </td>
            <td>
              <div class="input-group">
                <input type="number" min="0" class="form-control" name="volumenHddHVE">
                <div class="input-group-append">
                  <span class="input-group-text" id="basic-addon2">GB</span>
                </div>
              </div>
            </td>
          </tr>`;
  $("#filaInfoEquipo").append(fila);
  listarTypeDisk();
}

let nextinputprocesamiento = 0;
function agregarFilaProcesamiento() {
  $("#rowSinRegistro2").remove();
  nextinputprocesamiento++;
  fila = `<tr>
            <th scope="row">${nextinputprocesamiento}</th>
            <td>
              <select class="form-control" name="nombreProcesador" id="exampleFormControlSelect1">
                <option selected disabled>Seleccione...</option>
              </select>
            </td>
            <td>
              <div class="input-group">
                <input type="number" name="velocidadProcesador" min="0" step="0.01" class="form-control">
                <div class="input-group-append">
                  <span class="input-group-text" id="basic-addon2">GHz</span>
                </div>
              </div>
            </td>
            <td>
              <select class="form-control" name="tipoRAM" id="exampleFormControlSelect1">
                <option selected disabled>Seleccione...</option>
              </select>
            </td>
            <td>
              <div class="input-group">
                <input type="number" name="velocidadRAM" class="form-control" aria-label="Recipient's username" aria-describedby="basic-addon2">
                <div class="input-group-append">
                  <span class="input-group-text" id="basic-addon2">MHz</span>
                </div>
              </div>
            </td>
          </tr>`;
  $("#filaInfoProcesamiento").append(fila);
  listarCpuRam();
}

$( document ).ready(function() {
  filaequipo = `<tr id="rowSinRegistro1">
                  <th scope="row" colspan="4" class="text-center">No hay registros</th>
                </tr>`;
  filaprocesamiento = `<tr id="rowSinRegistro2">
                        <th scope="row" colspan="5" class="text-center">No hay registros</th>
                      </tr>`;
  
  $("#filaInfoEquipo").append(filaequipo);
  $("#filaInfoProcesamiento").append(filaprocesamiento);
});