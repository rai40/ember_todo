Todo.ListController = Ember.ObjectController.extend
  isNotCompleted: Ember.computed ->
    gotDirty = @get('tasks').filterProperty('isDirty').get('length') > 0
    allComplete = @get('minutesLeftToComplete') isnt null

    allComplete or gotDirty
  .property('minutesLeftToComplete', 'tasks.@each.isDirty')
