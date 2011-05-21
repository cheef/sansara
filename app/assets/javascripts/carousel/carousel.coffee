class Carousel
  constructor: (@element, params) ->
    @params    = $.extend(params || {}, @defaults)
    @api       = new Carousel.Api(this)
    @container = new Carousel.Container(this)

    this.subscribe 'initialize', (event) ->  this.subscribe @bindings
    this.trigger 'initialize'
    this.trigger 'draw'

  draw:     -> this.trigger 'draw'
  next:     -> this.trigger 'next'
  previous: -> this.trigger 'previous'

  trigger: ->
    params = Carousel.Utils.arrayFromArguments(arguments)
    name   = params.shift()
    self   = this
    throw "Trigger method should be called with event name" unless name?
    this.withDebug "triggering the '#{name}' event", ->
      $(self.element).triggerHandler(name, params)

  subscribe: ->
    bindings = Carousel.Utils.parseMixedArguments(arguments)
    self = this

    $.each bindings, (name, callback) ->
      $(self.element).bind name, $.proxy(callback, self)

  bindings:
    draw: (event) ->
    next: (event) ->
    previous: (event) ->

  withDebug: (message, callback) ->
    console.log(message) if window.console && @params.debug
    callback.call this

  defaults:
    direction: 'horizontal'

$.fn.carousel = (params) ->
  this.each ->
    carousel = new Carousel(this, params)
    $(this).data 'carousel', carousel.api
    window.trololo = carousel.api
