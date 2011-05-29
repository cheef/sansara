class Carousel.Themes.Eysmond
  constructor: (@api) ->
    @api.subscribe 'initialize.theme.eysmond',
      ((event, api) -> api.subscribe @bindings, @), @

  enable: ->
    api = @api
    $(@api.carousel.container.wrapper.layout).addClass @defaults.domClass
    $(@api.carousel.container.wrapper.element).prepend $('<div>').
      addClass('b-carousel-control').
      addClass('b-carousel-left-control').
      click -> api.previous()
    $(@api.carousel.container.wrapper.element).append  $('<div>').
      addClass('b-carousel-control').
      addClass('b-carousel-right-control').
      click -> api.next()

  bindings:
    'tail.theme.eysmond': (event, api) ->
      api.carousel.element.
        find('.b-carousel-right-control').
        addClass('b-disabled-control')
    'head.theme.eysmond': (event, api) ->
      api.carousel.element.
        find('.b-carousel-left-control').
        addClass('b-disabled-control')

  defaults:
    domClass: 'b-carousel-eysmond-theme'