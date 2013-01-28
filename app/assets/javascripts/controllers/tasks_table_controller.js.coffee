Todo.TasksTableController = Ember.ArrayController.extend
  itemController: 'TaskTableRow'
  isAddingNew: false

  contentWillChange: (->
    @filterProperty('isEditing').invoke 'cancelEditMode'
  ).observesBefore('content')


  addTask: ->
    list = @controllerFor('list').get 'model'
    store = list.get 'store'
    transaction = store.transaction()
    task = transaction.createRecord Todo.Task, list: list

    itemController = @itemControllerFor(task)
    itemController.enterEditMode(transaction)
    itemController.addObserver 'isEditing', @, 'isEditingChangedAfterAddingTask'

    @set 'isAddingNew', true


  isEditingChangedAfterAddingTask: (itemController, key) ->
    exitedEditingMode = not itemController.get(key)
    if exitedEditingMode
      itemController.removeObserver 'isEditing', @, 'isEditingChangedAfterAddingTask'
      @set 'isAddingNew', false



  enterEditMode: (task) -> task.enterEditMode()
  cancelEditMode: (task) -> task.cancelEditMode()
  save: (task) -> task.save()
  markAsDone: (task) -> task.markAsDone()
  deleteTask: (task) -> task.delete()


  itemControllerFor: (task) ->
    @find (controller) -> controller.get('model') is task
