obj =
  merge: (dest, source) ->
    for key, value of source
      Object.defineProperty dest, key,
        value: value
        writable: true
        enumerable: true
        configurable: true

    dest

  clone: (obj) ->
    return obj if (typeof obj != "object") || (obj instanceof RegExp)
    newObj = {}
    newObj[key] = @clone(val) for key, val of obj
    newObj

if module? then module.exports = obj else window.obj = obj
