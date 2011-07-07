class window.Sansara
  constructor: (element, params) ->
    @api = new Sansara.Api(element, this.mergeParams(params))

    this.initializeWidget()
    this.initializePlugins()

    @api.trigger 'initialize'
    @api.trigger 'draw' if @api.autorun

  initializeWidget: ->
    @api.widget = $.sansara.widgets[ @api.params.widget ]
    @api.widget.initialize(@api)

  initializePlugins: ->

  mergeParams: (params) ->
    $.extend {}, params || {}, @defaults

  defaults:
    autorun: true
    widget: 'horizontal'