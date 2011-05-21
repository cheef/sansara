class Carousel.Container
  constructor: (@carousel) ->
    @element = @carousel.element
    @carousel.subscribe @bindings

  bindings:
    'draw': (event) -> this.trigger 'container.draw'

    'container.draw': (event) ->
      $(@element).addClass 'b-carousel-items'
      this.trigger 'container.viewport.draw'
      this.trigger 'container.wrapper.draw'

    'container.viewport.draw': (event) ->
      console.log 'triggered draw of container'
      @container.viewport = new Carousel.Container.Viewport(@container)
      @container.viewport.draw()
      @container.viewport.element.css
        width:  @container.getViewportWidth()
        height: @container.getViewportHeight()

    'container.wrapper.draw': (event) ->
#      @wrapper = new Carousel.Container.Wrapper(@container.viewport.element, 'l-carousel')
#      @wrapper.draw()

  getViewportWidth:  -> @carousel.params.width
  getViewportHeight: -> @carousel.params.height

  setControls: ->
    @leftConwtrol = new Carousel.Container.Control(@wrapper.element, 'b-carousel-left-control')
    @leftControl.draw(method: 'prepend')
    @rightControl = new Carousel.Container.Control(@wrapper.element, 'b-carousel-right-control')
    @rightControl.draw(method: 'append')

  items: -> $(@element).children('li')
  itemMaxHeight: -> $(@element).height()
  itemMaxWidth: ->
    Math.round( $(@element).width() / items.size() )