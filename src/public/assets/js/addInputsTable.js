// let iteracion = 0;
function listarInfoDisk() {
  $.ajax({
    url: "/formulariohve/informcionEquipo",
    method: "GET",
    dataType: "json"
  }).done(msg => {
    console.log('Length marca disco: ', msg.marcadisco.length);
    msg.marcadisco.forEach(element => {
      // iteracion++;
      marcaDisk = `<option value="${element.id}">${element.nombre}</option>`
      $("select[name=marcaHddHVE]").append(marcaDisk);
      // console.log("Data: ",$(`select[name=marcaHddHVE]`));
      // console.log("Iteracion: ", iteracion);
    });
    iteracion = 0;
    msg.typeDisk.forEach(element => {
      tipoDisk = `<option value="${element.id}">${element.nombre}</option>`
      $("select[name=tipoHddHVE]").append(tipoDisk);
    });
  });
}

function listarCpu_Ram() {
  $.ajax({
    url: "/formulariohve/informcionEquipo",
    method: "GET",
    dataType: "json"
  }).done(msg => {
    msg.marcacpu.forEach(element => {
      marcaCPU = `<option value="${element.id}">${element.nombre}</option>`
      $("select[name=marcaCPUHVE]").append(marcaCPU);
    });
    msg.marcaram.forEach(element => {
      marcaRAM = `<option value="${element.id}">${element.nombre}</option>`
      $("select[name=nombreRAMHVE]").append(marcaRAM);
    });
    msg.typeRam.forEach(element => {
      tipoRam = `<option value="${element.id}">${element.nombre}</option>`
      $("select[name=tipoRAMHVE]").append(tipoRam);
    });
  });
}

let nextinputequipo = 0;
function agregarFilaCapacidadEquipo() {
  $("#rowSinRegistro1").remove();
  nextinputequipo++;
  fila = `<tr>
            <th scope="row">${nextinputequipo}</th>
            <td>
              <select class="form-control" name="marcaHddHVE">
                <option selected disabled>Seleccione...</option>
              </select>
            </td>
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
  listarInfoDisk();
}

$( document ).ready(function() {
  filaequipo = `<tr id="rowSinRegistro1">
                  <th scope="row" colspan="4" class="text-center">No hay registros</th>
                </tr>`;
  $("#filaInfoEquipo").append(filaequipo);

  listarCpu_Ram();
});