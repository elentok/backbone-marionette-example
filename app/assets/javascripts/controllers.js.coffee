class MyApp.Controllers.Entries
  constructor: ->
    @collection = new MyApp.Collections.Entries
    entries = $('#main').data('entries')
    @collection.reset(entries)
    window.col = @collection

  index: ->
    view = new MyApp.Views.EntryIndex(collection: @collection)
    MyApp.mainRegion.show(view)

  show: (id) ->
    entry = @collection.get(id)
    view = new MyApp.Views.EntryDetails(model: entry)
    MyApp.mainRegion.show(view)


class MyApp.Routers.Entries extends Backbone.Marionette.AppRouter
  appRoutes:
    '': 'index'
    'entries/:id': 'show'

MyApp.addInitializer ->
  controller = new MyApp.Controllers.Entries
  new MyApp.Routers.Entries(controller: controller)
