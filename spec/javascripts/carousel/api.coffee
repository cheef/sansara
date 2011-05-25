describe 'Carousel.Api', ->
  beforeEach ->
    @carousel =
      subscribe: ->
      trigger:   ->
    @api = new Carousel.Api @carousel

  for method in ['trigger', 'subscribe', 'next', 'previous']
    it "should has '#{method}' public method", ->
      expect( eval("typeof this.api.#{method}") ).toBe 'function'

  describe "when subscribe to the event", ->
    beforeEach ->
      spyOn @carousel, 'subscribe'
      @event = 'test'
      @callback = ->
      @api.subscribe @event, @callback
    it "should provide it to the carousel", ->
      expect(@carousel.subscribe).toHaveBeenCalled()
    it "and with same arguments", ->
      expect(@carousel.subscribe).toHaveBeenCalledWith @event, @callback

    describe "that can be called", ->
      beforeEach ->
        spyOn @carousel, 'trigger'
        @api.trigger @event
      it "should fire carousel event", ->
        expect(@carousel.trigger).toHaveBeenCalled()
      it "should fire carousel event with correct name", ->
        expect(@carousel.trigger).toHaveBeenCalledWith @event

  describe "with non-stub carousel", ->
    beforeEach ->
      @sandbox = defineCarousel()
      @api = $(@sandbox).data('carousel')

    describe "when subscribe", ->
      beforeEach ->
        @callback = ->
        @event = 'test'
        @api.subscribe @event, @callback
      it "should define subscribed event", ->
        expect($(@sandbox)).toHandle @event
      it "should set correct handler to the subscribed event", ->
        expect($(@sandbox)).toHandleWith @event, @callback
