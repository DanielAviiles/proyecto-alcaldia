$(document).ready(function () {
  $('a[data-toggle="tab"]').on( 'shown.bs.tab', function (e) {
    $.fn.dataTable.tables( {visible: true, api: true} ).columns.adjust();
  });
  $('#tableCargos, #tableDependencias, #tableAreaTrabajo, #tableEmpresaProveedor').DataTable({
    "responsive": true, "lengthChange": true, "autoWidth": false, "searching": false,
    lengthMenu: [[3, 5, 25, 50, -1], [3, 5, 25, 50, "Todo"]],
    "language": {
      "zeroRecords": "No hay datos disponibles en la tabla",
      "info": "Mostrando _START_ / _END_ de _TOTAL_ entradas",
      "infoEmpty": "No hay registros disponibles",
      "lengthMenu": "Mostrar _MENU_ entradas",
      "search": "Buscar: ",
      "paginate": {
        "next": "Siguiente",
        "previous": "Anterior"
      }
    },
    scrollY: '50vh',
    scrollCollapse: true,
    "scrollX": true
  });
});