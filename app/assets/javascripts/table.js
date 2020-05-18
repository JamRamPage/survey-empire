$(document).on('turbolinks:load', function() {
    oTable = $('#survey-table').DataTable({
      "orderable": true,
      info: false,
      "dom":'<<"row toolbar-row"<"col toolbar"f>><"spacer"><"row toolbar-row"<"col entries"l>><"half-spacer">t<"half-spacer"><"row toolbar-row"<"col"p>>>',
      language: { search: "", searchPlaceholder: "Survey Title" },
    });
    $('div.dataTables_filter input').addClass('border rounded shadow-sm d-inline searchbar');
});