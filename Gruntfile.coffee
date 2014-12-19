module.exports = (grunt) ->
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")

    uglify:
      build:
        src: "dist/obj.js"
        dest: "dist/obj.min.js"

    coffee:
      specs:
        src: "spec/obj_spec.coffee"
        dest: "spec/js/obj_spec.js"

    browserify:
      build:
        src: "src/**/*.coffee"
        dest: "dist/obj.js"
        options:
          transform: ["coffeeify"]

    jasmine:
      build:
        src: "dist/obj.js"
        options:
          specs: "spec/js/obj_spec.js"
          vendor: [
            "node_modules/jasmine-jquery/vendor/jquery/jquery.js"
            "node_modules/jasmine-jquery/lib/jasmine-jquery.js"
          ]

    compare_size:
      files: [
        "dist/obj.js"
        "dist/obj.min.js"
      ]
      options:
        compress:
          gz: (contents) ->
            require("gzip-js").zip(contents, {}).length

    concat:
      options:
        stripBanners: true
        banner: "// <%= pkg.name %> - v<%= pkg.version %> - <%= grunt.template.today('yyyy.mm.dd') %>\n\n\n"
        separator: "\n\n\n// -----\n\n\n"

    watch:
      options:
        livereload: true

      core:
        files: "src/**/*.coffee"
        tasks: [
          "browserify"
          "uglify"
        ]
        options:
          spawn: false

      specs:
        files: "spec/**/*.coffee"
        tasks: [
          "coffee:specs"
          "jasmine"
        ]
        options:
          spawn: false

  # 2. TASKS
  require("load-grunt-tasks")(grunt)

  # 3. PERFORM
  grunt.registerTask "default", [
    "browserify"
    "coffee"
    "uglify"
    "compare_size"
  ]

  grunt.registerTask "scripts", [
    "browserify"
    "coffee"
    "uglify"
    "jasmine"
    "compare_size"
  ]

  grunt.registerTask "spec", [
    "browserify"
    "coffee"
    "jasmine"
  ]
