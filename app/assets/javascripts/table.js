$(document).on('turbolinks:load', function() {
    if ($('.dataTables_wrapper').length){
        return 0;
    } else {
        $('table.display').DataTable({
            "orderable": true,
            info: false,
            responsive: {
              details: {
                  renderer: function ( api, rowIdx, columns ) {
                      var data = $.map( columns, function ( col, i ) {
                          return col.hidden ?
                              '<tr data-dt-row="'+col.rowIndex+'" data-dt-column="'+col.columnIndex+'">'+
                                  '<td class="responsive-table" style="color:#fff;">'+col.title+':'+'</td> '+
                                  '<td class="responsive-table" style="color:#fff;">'+col.data+'</td>'+
                              '</tr>' :
                              '';
                      } ).join('');
      
                      return data ?
                          $('<table/>').append( data ) :
                          false;
                  }
              }
          },
            "dom":'<<"row toolbar-row"<"col toolbar"f>><"spacer"><"row toolbar-row"<"col entries"l>><"half-spacer">t<"half-spacer"><"row toolbar-row"<"col"p>>>',
            language: { search: "", searchPlaceholder: "Survey Title" },
          });
          $('div.dataTables_filter input').addClass('border rounded shadow-sm d-inline searchbar');
    };
});