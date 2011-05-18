class Carousel.Container.Base
  constructor: (@parent, @domClass = 'l-base-class') ->
    @element = $('<div>').addClass(@domClass)
  bindings:
    'draw': ->


  draw: (options = { method: 'wrap' }) ->
    $(@parent).wrap @element
    this.load()
  load: ->
    @element = $(@parent).parent(".#{@domClass}")