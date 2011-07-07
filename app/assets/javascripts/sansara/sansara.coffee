class window.Sansara
  constructor: (@element, params) ->
    @params = $.extend {}, params || {}, @defaults

    @api = new Sansara.Api(this)

    this.initializeWidget()
    this.initializePlugins()

    @api.trigger 'initialize'
    @api.trigger 'draw' if @params.autorun

  initializeWidget: ->
    widgetName = @params.widget || 'horizontal'
    $.widgets[ widgetName ].initialize(@api)

  initializePlugins: ->

  defaults:
    autorun: true