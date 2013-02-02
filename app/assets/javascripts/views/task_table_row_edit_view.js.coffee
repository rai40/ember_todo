Todo.TaskTableRowEditView = Ember.View.extend
  tagName: 'tr'
  templateName: 'tasks/table_row_edit'
  classNames: ['is-editing']

  didInsertElement: -> @$("input[type=text]").focus()

  keyDown: (event) ->
    taskController = @get 'content'
    action = {27: 'cancelEditMode', 13: 'save'}[event.keyCode]

    if action
      $(event.target).blur()
      taskController[action]()
