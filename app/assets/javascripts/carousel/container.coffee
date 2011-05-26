class Carousel.Container
  constructor: (@carousel) ->
    @element = @carousel.element
    self = this
    @carousel.api.subscribe 'initialize',
      ((event, api) -> api.subscribe @bindings, @), @

  bindings:
    'draw.viewport': (event, api) ->
      @viewport = new Carousel.Container.Viewport(@element, @carousel)
      @viewport.draw()

    'draw.wrapper': (event, api) ->
      @wrapper = new Carousel.Container.Wrapper(@viewport.layout, @carousel)
      @wrapper.draw()

    'draw.container': (event, api) ->
      $(@element)
        .addClass('b-carousel-items')
        .css
          width: this.width()
          top: 0
          left: 0

  width: -> this.items().length * @viewport.width()
  items: -> $(@element).children('li')