$(document).ready(function() {
  var $followBtn = $("#follow_user_btn")
  if($followBtn.length === 0) return

  $followBtn.on("click", function(e) {
    var params = {
      followingUserId: $("#current_user_id").val(),
      targetProfileId: $followBtn.data("profile-id")
    }
    console.log(params)
    var jqxhr = $.post("/following", params)
    jqxhr.done(function(response) {
      console.log(response)
    })
    jqxhr.fail(function(response) {
      console.log(response)
    })
  })
})