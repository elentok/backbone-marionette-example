@MyApp = new Backbone.Marionette.Application

MyApp.module 'Models'
MyApp.module 'Collections'
MyApp.module 'Views'
MyApp.module 'Controllers'
MyApp.module 'Routers'

MyApp.addInitializer ->
  MyApp.addRegions(mainRegion: '#main')
  controller = new MyApp.Controllers.Entries
  new MyApp.Routers.Entries(controller: controller)
  Backbone.history.start()

$(document).ready ->
  MyApp.start()

