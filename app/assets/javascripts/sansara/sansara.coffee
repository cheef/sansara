class window.Sansara
  constructor: (@element, params) ->
    @params = $.extend(params || {}, @defaults)

    @api = new Sansara.Api(this)

    @api.trigger 'initialize'
    @api.trigger 'draw' if @params.autorun

  defaults:
    autorun: true