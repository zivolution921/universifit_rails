$(document).ready(function() {

  var $xdsoft_picker_month = $(".xdsoft_picker_month")
  var $xdsoft_today_button = $(".xdsoft_today_button")
  if($xdsoft_picker_month.length === 0) return

  var dateRe = /\d{4}\/\d+\/\d+/

  
  var start_date = new Date($("#start_date").data("value"))

  $("select.xdsoft_picker_month").val(start_date.getMonth()+1)


  $xdsoft_picker_month.on("change", function(e) {

    var date = dateRe.exec(window.location.href)
    if(Array.isArray(date)) {
       date = date[0]
    }
    var oldUrl = window.location.href
  
    if(!date) {
      date = strftime('%Y/%m/%d')
    }
    var d = date.split("/")
    var newDate = [d[0], $xdsoft_picker_month.val(), d[2]].join("/")
    if(!/date=/.test(window.location.href)) {
      oldUrl = window.location.href + "?date=" + date
    }
    var newUrl = oldUrl.replace(dateRe, newDate)
    window.location.href = newUrl
  })

  $xdsoft_today_button.on("click", function(e) {
    console.log('ok')
    var date = strftime('%Y/%m/%d')

    
    var oldUrl = window.location.href
  
    if(!date) {
      date = strftime('%Y/%m/%d')
      console.log('no date')
    }
    
    if(!/date=/.test(window.location.href)) {
      oldUrl = window.location.href + "?date=" + date
      console.log('setting date')
    }
    var newUrl = oldUrl.replace(dateRe, date)
    
    window.location.href = newUrl
  })
})

