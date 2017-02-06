$(document).ready(function() {
  var $xdsoft_picker_month = $(".xdsoft_picker_month")
  if($xdsoft_picker_month.length === 0) return

  console.log("hello date time picker")
  var start_date = new Date($("#start_date").data("value"))

  $("select.xdsoft_picker_month").val(start_date.getMonth()+1)

  $xdsoft_picker_month.on("change", function(e) {
    var newUrl = window.location.href.toString().split("?")[0]
    var newDate = start_date.toString()
    console.log(newDate)
    //window.location.href = newUrl + "?date=" ;//+ applyMonth(start_date, e.val())
  })
})