class Carousel.Api
  constructor: (@carousel) ->

  draw: -> this.trigger 'draw'
  next: -> this.trigger 'next'
  move: (params) -> this.trigger 'move', params
  previous:      -> this.trigger 'previous'

  trigger:   ->
    params = Carousel.Utils.arrayFromArguments(arguments)
    name   = params.shift()
    throw "Trigger method should be called with event name" unless name?
    params.unshift this
    this.debug "Triggering the '#{name}' event with", params, ->
      $(@carousel.element).triggerHandler(name, params)
  debug: (message, params, callback)->
    window.console.log(message, params) if window.console? && @carousel.params.debug
    callback.call this

  # Examples:
  #
  # api.subscribe('method', function() {
  #   ...
  # }, [context]);
  #
  # api.subscribe({
  #   method: function() {
  #     ...
  #   }
  # }, [context] )
  #
  subscribe: ->
    [ bindings, context ] = Carousel.Utils.parseMixedArguments(arguments)
    carousel = @carousel
    $.each bindings, (name, callback) ->
      $(carousel.element).bind name, $.proxy(callback, context)