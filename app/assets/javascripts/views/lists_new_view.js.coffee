Todo.ListsNewView = Ember.View.extend
  didInsertElement: -> @$("input[type=text]").focus()
