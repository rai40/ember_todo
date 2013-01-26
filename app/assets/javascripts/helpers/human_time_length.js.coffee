Ember.Handlebars.registerBoundHelper 'humanTimeLength', (minutes) ->
  if minutes
    parseInt(minutes, 10) + ' min'
