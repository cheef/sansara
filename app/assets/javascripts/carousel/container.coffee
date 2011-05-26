class Carousel.Container
  constructor: (@carousel) ->
    @element = @carousel.element
    @carousel.api.subscribe @bindings, this

  bindings:
    'draw': (event, api) -> api.trigger 'container.draw'

    'container.draw': (event, api) ->
      $(@element).addClass 'b-carousel-items'
      api.trigger 'container.viewport.draw'
      api.trigger 'container.wrapper.draw'

    'container.viewport.draw': (event, api) ->
      @viewport = new Carousel.Container.Viewport(this)
      @viewport.draw()
      @viewport.element.css
        width:  this.getViewportWidth()
        height: this.getViewportHeight()

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