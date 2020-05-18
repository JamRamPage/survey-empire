$(document).on('turbolinks:load', function() {
      $("#menu-toggle").click('a', function(e) {
          e.preventDefault();
          $("#wrapper").toggleClass("toggled");
      });
});
