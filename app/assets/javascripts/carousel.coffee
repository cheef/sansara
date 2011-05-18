class Carousel
  constructor: (@element, params) ->
    @params = $.extend(params || {}, @defaults)
    @api = new Carousel.Api @

    this.subscribe 'initialize', (event) ->
      this.subscribe this.bindings
    this.trigger 'initialize'
    this.trigger 'draw'

  # methods

  draw:     -> this.trigger 'draw'
  next:     -> this.trigger 'next'
  previous: -> this.trigger 'previous'

  trigger: ->
    params = Array.prototype.slice.call(arguments ? [])
    name   = params.shift()
    throw "Trigger method should be called wit
    h event name" unless name?
    this.withDebug "triggering the '#{name}' event", ->  $(@element).triggerHandler(name, params)

  subscribe: (nameOrHash, callback) ->
    if typeof nameOrHash is 'string'
      bindings = {}
      bindings[nameOrHash] = callback
    else
      bindings = nameOrHash

    if typeof bindings isnt 'object'
      throw "First param should be string('foo') or hash ({ foo: function() {} })"

    $(bindings).each (name, callback) ->
      $(@element).bind name, $.proxy(callback, this)

  # events

  bindings:
    draw: (event) ->
      @container = new Carousel.Container(@element, @params)
    next: (event) ->
    previous: (event) ->

  withDebug: (message, callback) ->
    console.log(message) if window.console && @params.debug
    callback.call this

  defaults:
    direction: 'horizontal'

$.fn.carousel = (params) ->
  this.each -> $(this).data 'carousel', new Carousel(this, params)
