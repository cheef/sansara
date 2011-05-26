class Carousel.Api
  constructor: (@carousel) ->
  next:     -> @carousel.next.apply      @carousel, arguments
  previous: -> @carousel.previous.apply  @carousel, arguments
  trigger:  ->
    params = Carousel.Utils.arrayFromArguments(arguments)
    name   = params.shift()
    throw "Trigger method should be called with event name" unless name?
    params.unshift this
    this.debug "Triggering the '#{name}' event", ->
      $(@carousel.element).triggerHandler(name, params)
  debug: (message, callback)->
    window.console.log(message) if window.console && @carousel.params.debug
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