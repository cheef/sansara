Carousel = Carousel || {}
Carousel.Utils =

  arrayFromArguments: (args) ->
    if typeof args is 'undefined' then []
    else Array.prototype.slice.call(args)

  parseMixedArguments: (args) ->
    args       = Carousel.Utils.arrayFromArguments(args)
    nameOrHash = args.shift()
    callback   = args.pop()

    if typeof nameOrHash is 'string'
      bindings = {}
      bindings[nameOrHash] = callback
    else
      bindings = nameOrHash

    if typeof bindings isnt 'object'
      throw "First param should be a string or hash, but received #{typeof bindings}"

    bindings
