(function() {
  var obj;

  obj = {
    merge: function(dest, source) {
      var key, value;
      for (key in source) {
        value = source[key];
        Object.defineProperty(dest, key, {
          value: value,
          writable: true,
          enumerable: true,
          configurable: true
        });
      }
      return dest;
    },
    clone: function(obj) {
      var key, newObj, val;
      if ((typeof obj !== "object") || (obj instanceof RegExp)) {
        return obj;
      }
      newObj = {};
      for (key in obj) {
        val = obj[key];
        newObj[key] = this.clone(val);
      }
      return newObj;
    }
  };

  if (typeof module !== "undefined" && module !== null) {
    module.exports = obj;
  } else {
    window.obj = obj;
  }

}).call(this);
