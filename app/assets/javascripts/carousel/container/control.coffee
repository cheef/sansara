class Carousel.Container.Control  extends Carousel.Container.Base
  draw: (append = true)->
    if append then $(@parent).append(@element) else $(@parent).prepend(@element)