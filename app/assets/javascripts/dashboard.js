$(document).ready(function() {
    $("ul.sidebar-items li").on("click", function(e) {
      var li = $(e.target)
      var href = li.find("a").attr("href")
      if(href) {
        window.location = href
      }
      
    })

    $(".referesh-when-clicked").on("click", function() { 
      window.location.reload(true)
      return true
    })

  })