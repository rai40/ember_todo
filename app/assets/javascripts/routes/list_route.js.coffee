Todo.ListRoute = Ember.Route.extend
  needs: ['regrets']

  events:
    delete: ->
      @controllerFor('regrets').deleteWithRegret @currentModel
      @transitionTo 'index'
