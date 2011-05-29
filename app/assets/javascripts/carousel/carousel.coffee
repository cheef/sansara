class Carousel
  constructor: (@element, params) ->
    @params = $.extend(@defaults, params || {})

    @api = new Carousel.Api(this)
    @api.subscribe 'initialize.carousel',
      ((event, api) -> api.subscribe @bindings, @), @

    @container     = new Carousel.Container(this)
    @pluginManager = new Carousel.PluginManager(this)

    @api.trigger 'initialize'
    @api.trigger 'draw' if @params.autorun
    @current = 1

  bindings:
    'draw.item': (event, api) ->
    'next.item': (event, api) ->
      api.trigger 'move', to: @current + 1
    'move.item': (event, api, params) ->
      $(@container.element).animate
        left: -(@container.viewport.width() * params.to) + @container.viewport.width()
      @current = params.to
    'previous.item': (event, api) ->
      api.trigger 'move', to: @current - 1

  defaults:
    autorun: true
    theme: 'Default'

$.fn.carousel = (params) ->
  this.each ->
    carousel = new Carousel(this, params)
    $(this).data 'carousel', carousel.api