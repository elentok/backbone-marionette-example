class MyApp.Views.Entry extends Backbone.Marionette.ItemView
  tagName: 'li'
  template: 'entries/entry'
  events:
    'click .destroy': 'destroy'

  destroy: ->
    @model.destroy() if confirm 'Are you sure?'

class MyApp.Views.EntryDetails extends Backbone.Marionette.ItemView
  template: 'entries/details'

class MyApp.Views.Entries extends Backbone.Marionette.CompositeView
  tagName: 'ul'
  itemView: MyApp.Views.Entry
  template: 'entries/index'
  events:
    'click .new-entry': 'newEntry'
  appendHtml: (collectionView, itemView) ->
    collectionView.$('.entries').append(itemView.el)
  newEntry: ->
    name = prompt('Enter name:')
    @collection.create name: name if name


