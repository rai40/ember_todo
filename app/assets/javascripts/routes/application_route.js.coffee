Todo.ApplicationRoute = Ember.Route.extend
  renderTemplate: ->
    @_super()
    @render 'regrets', outlet: 'regrets', into: 'application'
