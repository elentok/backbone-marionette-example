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

