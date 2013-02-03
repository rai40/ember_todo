Todo.ListsController = Ember.ArrayController.extend
  persistedLists: Ember.computed ->
    @filterProperty 'isNew', false
  .property('content.@each.isNew')
