module.exports = (grunt)->

  grunt.initConfig 
    pkg: grunt.file.readJSON 'package.json'

    bowercopy:
      options:
        srcPrefix: 'bower_components'
      scripts:
        options:
          destPrefix: 'dist/scripts/vendor'
        files:
          #'':'bower_components/'
          'livereload.js':'bower_components/livereload/dist/livereload.js'
          'ratchet.js':'bower_components/ratchet/dist/js/ratchet.js'
      css:
        options:
          destPrefix: 'dist/styles/vendor'
        files:
          # css
          'normalize.css':'bower_components/normalize-css/normalize.css'
          'ratchet.css':'bower_components/ratchet/dist/css/ratchet.css'
          'z01-ratchet-theme-android.css':'bower_components/ratchet/dist/css/ratchet-theme-android.css'
      fonts:
        options:
          destPrefix: 'dist'
        files:
          # fonts
          'fonts':'bower_components/ratchet/dist/fonts/'

    coffee:
      compile:
        files: 
          "dist/scripts/app.js": ['src/scripts/*.coffee', 'src/scripts/**/*.coffee']
      options:
        join: true

    jade:
      html:
        files:
          'dist':['src/index.jade'],
          'dist/views':['src/views/*.jade']
        options:
          client: false
          # hsd
          pretty: true 
          runtime: false

    sass:
      dist:
        files:
          'dist/styles/main.css': 'src/styles/main.scss'

    concat:
      vendorJS:
        src: 'dist/scripts/vendor/*.js'
        dest: 'dist/scripts/libs.js'
      vendorCSS:
        src: 'dist/styles/vendor/*.css'
        dest: 'dist/styles/libs.css'

    connect: 
      server:
        options:
          hostname: '0.0.0.0'
          port: 8080
          base: "dist"
          keepalive: false

    watch:
      scripts:
        files: ['src/views/*.jade', 'src/index.jade', 'src/scripts/*.coffee', 'src/scripts/**/*.coffee', 'src/styles/*.scss', 'src/styles/**/*.scss']
        tasks: ['default']
        options:
            spawn: true
            livereload: true

  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-jade'
  grunt.loadNpmTasks 'grunt-sass'
  grunt.loadNpmTasks 'grunt-bowercopy'
  grunt.loadNpmTasks 'grunt-contrib-concat'
  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-connect'

  grunt.registerTask 'default', ['coffee', 'jade', 'sass']
  grunt.registerTask 'bower', ['bowercopy', 'concat']
  grunt.registerTask 'serve', ['default', 'connect', 'watch']
