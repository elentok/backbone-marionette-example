class MyApp.Views.EntryDetails extends Backbone.Marionette.ItemView
  template: 'entries/details'

class MyApp.Views.EntryItem extends Backbone.Marionette.ItemView
  tagName: 'li'
  template: 'entries/index_item'
  events:
    'click .destroy': 'destroy'

  destroy: ->
    @model.destroy() if confirm('Are you sure?')

class MyApp.Views.EntryIndex extends Backbone.Marionette.CompositeView
  initialize: ->
    @collection.on 'add', @updateCount, this
    @collection.on 'remove', @updateCount, this

  itemView: MyApp.Views.EntryItem
  template: 'entries/index'
  appendHtml: (collectionView, itemView) ->
    collectionView.$('.entries').append(itemView.el)
  events:
    'click .new-entry': 'newEntry'
    'click .refresh': 'refresh'

  updateCount: ->
    @$('.items_count').text(@collection.length)

  newEntry: (event) ->
    event.preventDefault()
    name = prompt('Enter name: ')
    @collection.create({name: name}, wait: true) if name

  refresh: (event) ->
    event.preventDefault()
    @collection.fetch()


