describe "Sansara.Utils", ->

  describe "arrayFromArguments", ->

    for arg in [ undefined, null, [] ]
      it "should expects wrong arguments like '#{arg}' and convert it to array", ->
        expect( Sansara.Utils.arrayFromArguments arg ).toEqual []

    it "should converts 'arguments' object to array", ->
      @arg = -> arguments
      expect( Sansara.Utils.arrayFromArguments @arg ).toEqual []

  describe "parseMixedArguments", ->

    describe "when called with hash as first argument", ->

      describe "without context", ->
        beforeEach ->
          @arg = [ method: -> ]
          @result = Sansara.Utils.parseMixedArguments(@arg)
        it "should returns array with first element as same hash", ->
          expect( [ @result[0] ] ).toEqual @arg
        it "should returns array with second element as undefined", ->
          expect( @result[1] ).not.toBeDefined()

      describe "with context", ->
        beforeEach ->
          @context = 'test'
          @arg = [ { method: -> }, @context]
          @result = Sansara.Utils.parseMixedArguments(@arg)
        it "should returns array with second element as context", ->
          expect( @result[1] ).toEqual @context

    describe "when called with string as first argument and function as second", ->

      beforeEach -> @callback = ->

      describe "without context", ->
        beforeEach ->
         @method = 'method'
         @arg = [@method, @callback ]
         @result = Sansara.Utils.parseMixedArguments(@arg)
        it "should returns array with first element as hash", ->
          hash = {}
          hash[@method] = @callback
          expect( @result[0] ).toEqual hash

      describe "with context", ->
        beforeEach ->
          @context = 'test'
          @arg = ['method', @callback, @context]
          @result = Sansara.Utils.parseMixedArguments(@arg)
        it "should returns array with second element as context", ->
          expect( @result[1] ).toEqual @context