$(document).ready(function() {
  $(".show-comment").on("click", function(e) {
    $(this).addClass('hidden')
    $(this).parent().find("form").removeClass('hidden')
  })
})