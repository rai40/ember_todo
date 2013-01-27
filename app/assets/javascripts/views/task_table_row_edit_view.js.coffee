Todo.TaskTableRowEditView = Ember.View.extend
  tagName: 'tr'
  templateName: 'tasks/table_row_edit'
  classNames: ['is-editing']

  didInsertElement: -> @$("input[type=text]").focus()
