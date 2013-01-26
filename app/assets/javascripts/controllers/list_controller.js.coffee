Todo.ListController = Ember.ObjectController.extend
  isNotCompleted: Ember.computed ->
    got_dirty = @get('tasks').filterProperty('isDirty').get('length') > 0
    all_completed = @get('minutesLeftToComplete') isnt null

    all_completed or got_dirty
  .property('minutesLeftToComplete', 'tasks.@each.isDirty')
