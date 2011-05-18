class Carousel.Api
  constructor: (@carousel) ->
    $( ['trigger', 'subscribe', 'draw', 'next', 'previous'] ).each (i, method) ->
      console.log "define #{method}"
      this.test = 555
      this[method] = ->
        @carousel.call method, arguments
    window.tro = @