BASE_WIDTH = 1024
HRULE_HEIGHT_PCT = 0.0058

baseFontSize = parseFloat($("html").css("font-size")) 

resolveFont = ->
  $submitBtns = $("input[type=submit]").removeClass("transition")
  w = $(window).width()
  multiplier = w / BASE_WIDTH
  newFontSize = multiplier * baseFontSize
  newPct = Math.max(45, (newFontSize / 16) * 100)
  $("html").css("font-size", "#{newPct}%")
  setTimeout((-> $submitBtns.addClass("transition")), 0)

resolveHr = ->
  $hr = $(".landing-banner > .content > hr")
  w = $hr.width()
  h = Math.max 0.25, HRULE_HEIGHT_PCT * w
  $hr.height(h)

resolveResponsive = -> 
  resolveFont()
  resolveHr()
  
resolveResponsive()
$(window).resize resolveResponsive
setTimeout((-> $("body").show()),0)

