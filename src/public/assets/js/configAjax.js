$(document).ready(function () {
  const dataEquipo = $('#tableOrdenadores').DataTable( {
    "ajax": "/ordenadores/info-ordenadores",
    "columns": [
      {
        "className":      'details-control',
        "orderable":      false,
        "data":           null,
        "defaultContent": ''
      },
      { "data": "name" },
      { "data": "position" },
      { "data": "office" },
      { "data": "salary" }
    ],
    "order": [[1, 'asc']]
} );

  // Add event listener for opening and closing details
  $('#example tbody').on('click', 'td.details-control', function () {
      var tr = $(this).closest('tr');
      var row = table.row( tr );

      if ( row.child.isShown() ) {
          // This row is already open - close it
          row.child.hide();
          tr.removeClass('shown');
      }
      else {
          // Open this row
          row.child( format(row.data()) ).show();
          tr.addClass('shown');
      }
  } );
});