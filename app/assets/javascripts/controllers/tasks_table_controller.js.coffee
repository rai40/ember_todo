Todo.TasksTableController = Ember.ArrayController.extend
  itemController: 'TaskTableRow'

  enterEditMode: (task) -> task.enterEditMode()
  cancelEditMode: (task) -> task.cancelEditMode()
  save: (task) -> task.save()
  deleteTask: (task) -> task.delete()

