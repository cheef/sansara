class Carousel
  constructor: (element, params) ->
    @params    = $.extend(params || {}, @defaults)
    @container = new Carousel.Container(element, @params)
  next: ->
  previous: ->
  defaults:
    direction: 'horizontal'

$.fn.carousel = (params) ->
  this.each -> $(this).data 'carousel', new Carousel(this, params)
