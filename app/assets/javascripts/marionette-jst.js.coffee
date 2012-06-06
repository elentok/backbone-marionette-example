Backbone.Marionette.Renderer.render = (template, data) ->
  if (!JST[template])
    throw "Template '#{template}' not found!"
  JST[template](data)
