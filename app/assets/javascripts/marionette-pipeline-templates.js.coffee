Backbone.Marionette.Renderer.render = (template, data) ->
  console.log "rendering template #{template}"
  if (!JST[template])
    throw "Template '#{template}' not found!"
  JST[template](data)
