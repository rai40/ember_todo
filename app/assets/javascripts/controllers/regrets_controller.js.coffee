Todo.RegretsController = Ember.ArrayController.extend
  content: []

  deleteWithRegret: (object) ->
    @pushObject object
    @store.transaction().add object
    object.deleteRecord()
    # Need to delete record, but when we delete it and transitions to index Ember reloads
    # the lists, and gets the list back not deleted at the server, resulting in:
    # Uncaught Error: Attempted to handle event `loadedData` on <Todo.List:ember450:19> while in state rootState.deleted.uncommitted. Called with undefined

