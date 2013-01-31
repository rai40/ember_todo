Todo.ListsNewRoute = Ember.Route.extend
  model: -> Ember.Object.create()

  events:
    create: ->
      record = Todo.List.createRecord @currentModel.getProperties('name')
      record.one 'didCreate', => setTimeout (=> @transitionTo 'list', record), 0
      record.get('store').commit()

    cancel: ->
      @transitionTo 'lists'
