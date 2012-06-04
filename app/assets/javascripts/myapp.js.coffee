@MyApp = new Backbone.Marionette.Application

MyApp.module 'Models'
MyApp.module 'Collections'
MyApp.module 'Views'
MyApp.module 'Controllers'
MyApp.module 'Routers'

class MyApp.Models.Entry extends Backbone.Model

class MyApp.Collections.Entries extends Backbone.Collection
  url: '/api/entries'
  model: MyApp.Models.Entry

class MyApp.Views.Entry extends Backbone.Marionette.ItemView
  tagName: 'li'
  template: 'entries/entry'

class MyApp.Views.EntryDetails extends Backbone.Marionette.ItemView
  template: 'entries/details'

class MyApp.Views.Entries extends Backbone.Marionette.CompositeView
  tagName: 'ul'
  itemView: MyApp.Views.Entry
  template: 'entries/index'
  appendHtml: (collectionView, itemView) ->
    collectionView.$('.entries').append(itemView.el)

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

MyApp.addInitializer ->
  MyApp.addRegions(mainRegion: '#main')
  controller = new MyApp.Controllers.Entries
  new MyApp.Routers.Entries(controller: controller)
  Backbone.history.start()

$(document).ready ->
  MyApp.start()

