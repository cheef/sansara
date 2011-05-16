class Carousel
  constructor: (element, params) ->
    @params    = $.extend(params || {}, @defaults)
    @container = new Carousel.Container(element, @params)
  next: ->
  previous: ->
  defaults:
    direction: 'horizontal'

class Carousel.Container
  constructor: (@element, @params) ->
    $(@element).addClass 'b-carousel-viewport'
    $(@element).css
      width: $(@element).outerWidth()
      top: 0
      left: 0
    this.setViewport()
    this.setWrapper()
    this.setControls()
  setViewport: ->
    @viewport = new Carousel.Container.Viewport(@element, 'l-carousel-viewport')
    @viewport.draw()
    @viewport.element.css
      width:  this.getViewportWidth()
      height: this.getViewportHeight()
  setWrapper: ->
    @wrapper = new Carousel.Container.Wrapper(@viewport.element, 'l-carousel')
    @wrapper.draw()
  getViewportWidth:  -> @params.width  || this.itemMaxWidth()
  getViewportHeight: -> @params.height || this.itemMaxHeight()
  setControls: ->
    @leftControl = new Carousel.Container.Control(@wrapper.element, 'b-carousel-left-control')
    @leftControl.draw(method: 'prepend')
    @rightControl = new Carousel.Container.Control(@wrapper.element, 'b-carousel-right-control')
    @rightControl.draw(method: 'append')

  items: -> $(@element).children('li')
  itemMaxHeight: -> $(@element).height()
  itemMaxWidth: ->
    Math.round( $(@element).width() / items.size() )

class Carousel.Container.Base
  constructor: (@parent, @domClass = 'l-base-class') ->
    @element = $('<div>').addClass(@domClass)
  draw: (options = { method: 'wrap' }) ->
    $(@parent).wrap @element
    this.load()
  load: ->
    @element = $(@parent).parent(".#{@domClass}")

class Carousel.Container.Viewport extends Carousel.Container.Base
class Carousel.Container.Wrapper  extends Carousel.Container.Base
class Carousel.Container.Control  extends Carousel.Container.Base
  draw: (append = true)->
    if append then $(@parent).append(@element) else $(@parent).prepend(@element)

$.fn.carousel = (params) ->
  this.each -> $(this).data 'carousel', new Carousel(this, params)
