module.exports = (grunt) ->

  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-slim"
  grunt.loadNpmTasks "grunt-contrib-stylus"
  grunt.loadNpmTasks "grunt-inline"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-contrib-copy"
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-browser-sync'

  # Project configuration.
  grunt.initConfig
    pkg: grunt.file.readJSON("package.json")
    slim: # Task
      build: # Target
        files: # Dictionary of files
          "build/index.html": "src/index.slim"

    stylus:
      build:
        files:
          "build/style.css": "src/stylesheets/style.styl"
        options:
          banner: '/*! <%= pkg.name %> <%= grunt.template.today("yyyy-mm-dd, HH:mm") %> */\n'
          compress: true
          include: true

    inline:
        dist:
          src: 'build/index.html'
          dest: 'build/index.html'

    concat:
      options:
        separator: ';'
      build:
        src: ["src/scripts/script.js"],
        dest: 'build/script.js'

    uglify:
      options:
        compress: {}
      build:
        files:
          'build/script.js': ['build/script.js']

    copy:
      build:
        files: [
          {
            src: "src/images/favicon.ico"
            dest: "build/favicon.ico"
          },
          {expand: true, cwd: 'src/images/', src: '**', dest: 'build/images/'},
        ]

    watch:
      build:
        files: ["src/**/*", "Gruntfile.coffee"]
        tasks: ["build"]

    browserSync:
      build:
          bsFiles:
            src : 'src/*/**'
          options:
            watchTask: true
            server:
              host: "localhost"
              baseDir: "build"
  # Default task(s).
  grunt.registerTask "default", ["build","watch"]
  grunt.registerTask "build", ["slim", "stylus", "concat", "copy", "uglify", "inline"]
