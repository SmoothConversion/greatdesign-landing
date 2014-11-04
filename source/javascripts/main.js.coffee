BASE_WIDTH = 1024
HRULE_HEIGHT_PCT = 0.0058

designBgLoaded = false
baseFontSize = parseFloat($("html").css("font-size"))

resolveFont = ->
  $submitBtns = $("button.submit, .social a").removeClass("transition")
  w = $(window).width()
  multiplier = w / BASE_WIDTH
  newFontSize = multiplier * baseFontSize
  newPct = Math.max(35, (newFontSize / 16) * 100 * 0.8)
  $("html").css("font-size", "#{newPct}%")
  setTimeout((-> $submitBtns.addClass("transition")), 0)

resolveHr = ->
  $hr = $(".landing-banner > .content > hr")
  w = $hr.width()
  h = Math.max 0.25, HRULE_HEIGHT_PCT * w
  $hr.height(h)

resolveDesignersBgTop = ->
  if $(".designer-landing").length
    h = $("body").height()
    bgh = $(".bg").height()

    console.log h
    console.log bgh

    if bgh and bgh < h
      $(".bg").css("top", h - bgh)

resolveDesigners = ->
  if $(".designer-landing").length
    img = $(".bg img").one "load", ->
      designBgLoaded = true
      resolveDesignersBgTop()


    if img[0].complete
      console.log "image already loaded"
      designBgLoaded = true
      $ -> resolveDesignersBgTop()


resolveResponsive = ->
  resolveFont()
  resolveHr()
  resolveDesignersBgTop() if designBgLoaded

resolveResponsive()
resolveDesigners()
$(window).resize resolveResponsive
setTimeout(
  (->
    $("body").animate({opacity: 1}, {easing: "swing", duration: 600})),
  0)

$("form").submit (e)->
  _gaq.push("_trackEvent", "landing", "signup", $(e.target).attr("id"))

$ ->
  $(".utm-input").attr("value", getParameterByName("utm"))

