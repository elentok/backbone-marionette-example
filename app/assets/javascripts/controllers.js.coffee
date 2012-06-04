class MyApp.Controllers.Entries
  constructor: ->
    @collection = new MyApp.Collections.Entries
    main = $('#main')
    @collection.reset(main.data('entries'))
    window.col = @collection
    main.removeData('entries')

  index: ->
    view = new MyApp.Views.Entries
      collection: @collection
    MyApp.mainRegion.show(view)

  show: (id) ->
    entry = @collection.get(id)
    view = new MyApp.Views.EntryDetails(model: entry)
    MyApp.mainRegion.show(view)


class MyApp.Routers.Entries extends Backbone.Marionette.AppRouter
  appRoutes:
    '': 'index'
    'entries/:id': 'show'

