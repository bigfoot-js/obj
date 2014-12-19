(function e(t,n,r){function s(o,u){if(!n[o]){if(!t[o]){var a=typeof require=="function"&&require;if(!u&&a)return a(o,!0);if(i)return i(o,!0);var f=new Error("Cannot find module '"+o+"'");throw f.code="MODULE_NOT_FOUND",f}var l=n[o]={exports:{}};t[o][0].call(l.exports,function(e){var n=t[o][1][e];return s(n?n:e)},l,l.exports,e,t,n,r)}return n[o].exports}var i=typeof require=="function"&&require;for(var o=0;o<r.length;o++)s(r[o]);return s})({1:[function(require,module,exports){
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



},{}]},{},[1]);
