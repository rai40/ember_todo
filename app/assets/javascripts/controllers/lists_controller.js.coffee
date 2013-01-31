Todo.ListsController = Ember.ArrayController.extend
  persistedLists: Ember.computed ->
    @get('content').filter (list) -> not list.get('isNew')
  .property('content.@each.isNew')
