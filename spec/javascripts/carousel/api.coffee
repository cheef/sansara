describe 'Carousel.Api', ->
  beforeEach ->
    @carousel =
      subscribe: ->
      trigger:   ->
    @api = new Carousel.Api @carousel

  for method in ['trigger', 'subscribe', 'next', 'previous']
    it "should has '#{method}' public method", ->
      expect( eval("typeof this.api.#{method}") ).toBe 'function'

  describe "with carousel", ->
    beforeEach ->
      @sandbox = defineCarousel()
      @api = $(@sandbox).data('carousel')

    describe "when subscribed", ->
      beforeEach ->
        @callback = ->
        @event = 'test'
        @api.subscribe @event, @callback
      it "should define subscribed event", ->
        expect($(@sandbox)).toHandle @event
      it "should set correct handler to the subscribed event", ->
        expect($(@sandbox)).toHandleWith @event, @callback
