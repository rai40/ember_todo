Todo.ListsNewRoute = Ember.Route.extend
  model: -> Todo.List.createRecord()

  exit: ->
    if @currentModel.get 'isNew'
      @currentModel.deleteRecord()


  events:
    create: ->
      record = @currentModel
      record.one 'didCreate', => setTimeout (=> @transitionTo 'list', record), 0
      @store.commit()

    cancel: ->
      @transitionTo 'lists'
