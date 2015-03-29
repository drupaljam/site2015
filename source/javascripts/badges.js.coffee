
$(document).ready ->
  $(".badge input:text").focus ->
    $(this).select();
  .mouseup (e) -> e.preventDefault()