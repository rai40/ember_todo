Todo.ListsNewRoute = Ember.Route.extend
  model: -> Todo.List.createRecord()

  exit: ->
    if @currentModel.get 'isNew'
      @currentModel.deleteRecord()


  events:
    create: ->
      @currentModel.on 'didCreate', => setTimeout (=> @transitionTo 'list', @currentModel), 0
      @currentModel.get('store').commit()

    cancel: ->
      @transitionTo 'lists'
