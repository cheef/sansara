class Carousel.Api
  constructor: (@carousel) ->
  trigger:   -> @carousel.trigger.apply   @carousel, arguments
  subscribe: -> @carousel.subscribe.apply @carousel, arguments
  next:      -> @carousel.next.apply      @carousel, arguments
  previous:  -> @carousel.previous.apply  @carousel, arguments