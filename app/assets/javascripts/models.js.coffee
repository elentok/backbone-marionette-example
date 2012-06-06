class MyApp.Models.Entry extends Backbone.Model

class MyApp.Collections.Entries extends Backbone.Collection
  url: '/api/entries'
  model: MyApp.Models.Entry
