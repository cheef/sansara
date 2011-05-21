class Carousel.Api
  constructor: (@carousel) ->
  trigger:   -> @carousel.trigger(arguments)
  subscribe: -> @carousel.subscribe(arguments)
  next:      -> @carousel.next(arguments)
  previous:  -> @carousel.previous(arguments)