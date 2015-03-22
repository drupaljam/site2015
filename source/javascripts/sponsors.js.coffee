
$.fn.shuffle = ->
  m = this.length
  while(m)
    i = Math.floor(Math.random() * m--)

    if(i != m)
      temp_element = $('<span />')
      $(this[i]).after(temp_element);
      $(this[i]).detach()
      $(this[m]).after(this[i])
      $(this[m]).detach()
      $(temp_element).after(this[m])
      $(temp_element).detach()
    
    t = this[m];
    this[m] = this[i];
    this[i] = t

  return this

$(document).ready ->
  $('.sponsors').each ->
    $('.sponsor', this).shuffle()