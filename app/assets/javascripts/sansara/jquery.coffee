$.sansara = (selector, params) ->
  $(selector).each ->
    sansara = new Sansara(this, params)
    $(this).data 'sansara', sansara.api

$.sansara.widgets = {}
$.sansara.widget  = (name, methods) ->
  $.sansara.widgets[ name ] = new Sansara.Widget(name, methods)

$.sansara.plugins = {}
$.sansara.plugin  = (name, methods) ->
  $.sansara.plugins[ name ] = new Sansara.Plugin(methods)

$.fn.sansara = (params) ->
  $.sansara(this, params)