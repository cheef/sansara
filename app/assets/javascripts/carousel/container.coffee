class Carousel.Container
  constructor: (@element, @params) ->
    carousel.subscribe 'draw', (carousel) ->
      carousel.trigger('container.viewport.create')
      carousel.trigger('container.wrapper.create')
      carousel.trigger('container.controls.create')

  bindings:
    'viewport.create': (carousel) ->
      @viewport = new Carousel.Container.Viewport(@element, 'l-carousel-viewport')
      @viewport.draw()
      @viewport.element.css
        width:  this.getViewportWidth()
        height: this.getViewportHeight()

    'wrapper.create': (carousel) ->
      @wrapper = new Carousel.Container.Wrapper(@viewport.element, 'l-carousel')
      @wrapper.draw()


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