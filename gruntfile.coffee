# Generated on 2015-07-09 using generator-reveal 0.5.0

module.exports = (grunt) ->
  grunt.initConfig
    watch:
      livereload:
        options:
          livereload: true
        files: [
          'index.html'
          'notes.md'
          'css/theme.css'
        ]

      coffeelint: files: ['gruntfile.coffee'], tasks: ['coffeelint']

      sass: files: ['css/source/theme.scss'], tasks: ['sass']

    sass: theme: files: 'css/theme.css': 'css/source/theme.scss'

    connect:
      livereload:
        options:
          port: 9000
          # Change hostname to '0.0.0.0' to access
          # the server from outside.
          hostname: '0.0.0.0'
          base: '.'
          open: true
          livereload: true

    coffeelint:
      options: configFile: 'coffeelint.json'
      all: ['gruntfile.coffee']


    # Load all grunt tasks.
    require('load-grunt-tasks')(grunt)

    grunt.registerTask 'test', '*Lint* coffee files.', ['coffeelint']

    grunt.registerTask 'serve',
      'Run presentation locally and start watch process (living document).', [
        'sass'
        'connect:livereload'
        'watch'
      ]

    # Define default task.
    grunt.registerTask 'default', [
        'test'
        'serve'
    ]
