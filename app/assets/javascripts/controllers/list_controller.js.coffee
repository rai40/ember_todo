Todo.ListController = Ember.ObjectController.extend
  isNotCompleted: Ember.computed ->
    gotDirty = @get('tasks').someProperty('isDirty')
    allComplete = @get('minutesLeftToComplete') isnt null

    allComplete or gotDirty
  .property('minutesLeftToComplete', 'tasks.@each.isDirty')
