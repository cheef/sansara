class window.Sansara
  constructor: (element, params) ->
    @api = new Sansara.Api(element, this.mergeParams(params))

    this.initializeWidget()
    this.initializePlugins()

    @api.trigger 'initialize'
    @api.trigger 'draw' if this.isAutorun()

  initializeWidget: ->
    @api.widget = $.sansara.widgets[ @api.params.widget ]
    @api.widget.enable(@api)

  initializePlugins: ->

  mergeParams: (params) ->
    $.extend {}, params || {}, @defaults

  isAutorun: -> @api.params.autorun is true

  defaults:
    autorun: true
    widget: 'horizontal'
    debug: true