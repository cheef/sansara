class Carousel
  constructor: (@element, params) ->
    @params = $.extend(params || {}, @defaults)

    @api = new Carousel.Api(this)
    @api.subscribe 'initialize',
      ((event, api) -> api.subscribe @bindings, @), @

    @container = new Carousel.Container(this)

    @api.trigger 'initialize'
    @api.trigger 'draw' if @params.autorun
    @current = 1

  bindings:
    draw: (event, api) ->
    next: (event, api) ->
      api.trigger 'move', to: @current + 1
    move: (event, api, params) ->
      $(@container.element).animate
        left: -(@container.viewport.width() * params.to) + @container.viewport.width()
      @current = params.to
    previous: (event, api) ->
      api.trigger 'move', to: @current - 1

  defaults:
    direction: 'horizontal'
    autorun: true

$.fn.carousel = (params) ->
  this.each ->
    carousel = new Carousel(this, params)
    $(this).data 'carousel', carousel.api