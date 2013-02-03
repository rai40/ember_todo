Todo.TaskTableRowShowView = Ember.View.extend
  tagName: 'tr'
  templateName: 'tasks/table_row_show'

  doubleClick: (event) ->
    @clearTextSelection()
    @get('content').enterEditMode()

  clearTextSelection: ->
    if window.getSelection
      window.getSelection().removeAllRanges()
    else if document.selection
      document.selection.empty()
