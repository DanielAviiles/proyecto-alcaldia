/* Formatting function for row details - modify as you need */
function format ( d ) {
  // `d` is the original data object for the row
  return `<div class="col-lg-12 table-responsive">
            <table>
              <tr>
                <td><b>Fecha Adquisicion: </b></td>
                <td>${d.fecha_adquision}</td>
              </tr>
              <tr>
                <td><b>Empresa / Proveedor: </b></td>
                <td>${d.nombre_empresa}</td>
              </tr>
              <tr>
                <td><b>NIT Empresa: </b></td>
                <td>${d.nit}</td>
              </tr>
              <tr>
                <td><b>Obejto del contrado: </b></td>
                <td>${d.objeto_contrato}</td>
              </tr>
            </table>
          </div>`;
}

$(document).ready(function () {
  let ordenadores = $('#ordenadorTable').DataTable({
    "responsive": true, "lengthChange": true, "autoWidth": false,
    lengthMenu: [[5, 10, 25, 50, -1], [5, 10, 25, 50, "All"]],
    "language": {
      "zeroRecords": "No hay datos disponibles en la tabla",
      "info": "Mostrando _START_ a _END_ de _TOTAL_ entradas",
      "infoEmpty": "No hay registros disponibles",
      "lengthMenu": "Mostrar _MENU_ entradas",
      "search": "Buscar: ",
      "paginate": {
        "next": "Siguiente",
        "previous": "Anterior"
      }
    },
    "ajax": "/ordenadores/info-ordenadores",
    "columns": [
      {
        "className":      'details-control',
        "orderable":      false,
        "data":           null,
        "defaultContent": '<i class="fas fa-plus-circle text-center" style="cursor: pointer;"></i>'
      },
      { "data": "codigo_equipo" },
      { "data": "nombre_completo" },
      { "data": "tipo_equipo" },
      { "data": "estado_nombre" }
    ],
    select: {
      style:    'os',
      selector: 'td:first-child'
    },
    "order": [[1, 'desc']]
  });

  // Add event listener for opening and closing details
  $('#ordenadorTable tbody').on('click', 'td.details-control', function () {
    var tr = $(this).closest('tr');
    var row = ordenadores.row(tr);

    $(this)
    .find('[data-fa-i2svg]')
    .toggleClass('fa-minus-circle')
    .toggleClass('fa-plus-circle');

    if ( row.child.isShown() ) {
      row.child.hide();
    } else {
      row.child( format(row.data()) ).show();
    }
  });
});