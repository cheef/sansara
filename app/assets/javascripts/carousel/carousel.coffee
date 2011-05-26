class Carousel

  constructor: (@element, params) ->
    @params = $.extend(params || {}, @defaults)
    self    = this

    @api = new Carousel.Api(this)
    @api.subscribe 'initialize', (event, api) -> api.subscribe self.bindings, self

    @container = new Carousel.Container(this)

    @api.trigger 'initialize'
    @api.trigger 'draw' if @params.autorun

  draw:     -> this.trigger 'draw'
  next:     -> this.trigger 'next'
  previous: -> this.trigger 'previous'

  bindings:
    draw:     (event, api) ->
    next:     (event, api) ->
    previous: (event, api) ->

  defaults:
    direction: 'horizontal'
    autorun: true

$.fn.carousel = (params) ->
  this.each ->
    carousel = new Carousel(this, params)
    $(this).data 'carousel', carousel.api