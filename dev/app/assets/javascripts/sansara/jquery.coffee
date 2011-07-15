$.sansara = (selector, params) ->
  $(selector).each ->
    sansara = new Sansara(this, params)
    $(this).data 'sansara', sansara.api

$.sansara.widgets = {}
$.sansara.widget  = (name, methods) ->
  unless $.type(name) is 'string'
    window.console.error "Wrong name for widget", name if window.console?
  else
    $.sansara.widgets[ name ] = new Sansara.Widget(name, methods)

$.sansara.plugins = {}
$.sansara.plugin  = (name, methods) ->
  unless $.type(name) is 'string'
    window.console.error "Wrong name for plugin", name if window.console?
  else
    $.sansara.plugins[ name ] = new Sansara.Plugin(name, methods)

$.fn.sansara = (params) ->
  $.sansara(this, params)