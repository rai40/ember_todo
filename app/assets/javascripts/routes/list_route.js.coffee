Todo.ListRoute = Ember.Route.extend
  events:
    delete: ->
      if confirm 'Are you sure you want to delete ' + @currentModel.get('name') + '?'
        @currentModel.deleteRecord()
        @store.commit()
        @transitionTo 'index'
