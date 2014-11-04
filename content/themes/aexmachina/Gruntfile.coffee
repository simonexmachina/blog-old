_ = require 'lodash'

module.exports = (grunt)->
  cfg =
    pkg: grunt.file.readJSON('package.json')
    watch:
      sass:
        files: ['assets/sass/*.scss']
        tasks: ['sass:dev']
    livereload:
      files: [
        'assets/css/*.css',
        'assets/js/*.js'
      ]
      options: livereload: true
    sass:
      dev: sassConfig  = 
        files:
          'assets/css/screen.css': 'assets/sass/screen.scss'
          'assets/css/typography.css': 'assets/sass/typography.scss'
        options:
          includePaths: [
            '../../../core/client/assets/sass'
          ]
      prod: _.merge({}, sassConfig, options: style: 'compressed')

  # load all grunt tasks
  require('matchdep').filterDev('grunt-*').forEach(grunt.loadNpmTasks)
  grunt.initConfig cfg
  grunt.registerTask 'default', 'sass:dev'
