buildCarouselSandbox = ->
  buildLi = ->
    li = $('<li>')
    image = $('<img>').attr('src', 'http://placekitten.com/250/200')
    li.html image
  carousel = $('<ul>').attr('id', 'carousel')
  for time in [1..5]
    do -> carousel.append buildLi()
  carousel

setCarouselSandbox = ->
  setFixtures buildCarouselSandbox()
  $('#carousel')

defineCarousel = (params = {}) ->
  defaults =
    width: 250
    height: 250

  sandbox = setCarouselSandbox()
  sandbox.carousel $.extend(defaults, params)

apiStub = ->
  subscribe: ->
  carousel: {}
