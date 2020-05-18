$(document).on('turbolinks:load', function() {
    $('#survey-table').DataTable({
      bJQueryUI: true,
      sPaginationType: "full_numbers",
      iDisplayLength: 100,
      "searching": true,
    });
    $('.dataTables_length').addClass('bs-select');
});