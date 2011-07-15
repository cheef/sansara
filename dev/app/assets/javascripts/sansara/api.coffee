class Sansara.Api

  constructor: (@element, @params) ->

  plugins: {}

  debug: (message, params, callback) ->
    window.console.log(message, params) if window.console? && @params.debug
    callback.call this

  trigger: ->
    params = Sansara.Utils.arrayFromArguments(arguments)
    name   = params.shift()
    throw "Trigger method should be called with event name" unless name?
    params.unshift this
    this.debug "Triggering the '#{name}' event with", params, ->
      $(@element).triggerHandler(name, params)

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
    [ bindings, context ] = Sansara.Utils.parseMixedArguments(arguments)
    element = @element
    $.each bindings, (name, callback) ->
      $(element).bind name, $.proxy(callback, context)