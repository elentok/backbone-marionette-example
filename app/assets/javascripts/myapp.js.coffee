window.MyApp = new Backbone.Marionette.Application

MyApp.module 'Models'
MyApp.module 'Collections'
MyApp.module 'Views'
MyApp.module 'Controllers'
MyApp.module 'Routers'

$(document).ready ->
  MyApp.addRegions(mainRegion: '#main')
  MyApp.addInitializer ->
    Backbone.history.start()

  MyApp.start()
