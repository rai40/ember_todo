Todo.TasksTableController = Ember.ArrayController.extend
  itemController: 'TaskTableRow'

  addTask: ->
    list = @controllerFor('list').get 'model'
    store = list.get 'store'
    transaction = store.transaction()
    task = transaction.createRecord Todo.Task, list: list

    itemController = @itemControllerFor(task).enterEditMode(transaction)

  enterEditMode: (task) -> task.enterEditMode()
  cancelEditMode: (task) -> task.cancelEditMode()
  save: (task) -> task.save()
  deleteTask: (task) -> task.delete()


  itemControllerFor: (task) ->
    @find (controller) -> controller.get('model') is task
