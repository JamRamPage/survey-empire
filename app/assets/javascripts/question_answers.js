$(document).on('turbolinks:load', function() {
    $('.Submit').click(function() {
        var bid = $(this).attr('id');
        //alert('#'+bid+" input");
    	$('#'+bid+" input").prop('disabled', true);
    })
});