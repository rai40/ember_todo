Todo.TaskTableRowsView = Ember.CollectionView.extend
  tagName: 'tbody'
  emptyView: Ember.View.extend(template: Ember.Handlebars.compile '<td colspan="4">No tasks, yet.</td>')


  itemViewClass: Ember.View.extend
    templateName: 'tasks/table_row'
    classNameBindings: ['content.isEditing']

    giveFocusToInput: ( (rowController, key) =>
      if rowController.get('isEditing')
        # We are getting called before the view has updated.
        # Lets wait to the next free moment to do our work.
        Ember.run.next @, -> @$("input[type=text]").focus()
    ).observes('content.isEditing')


    keyDown: (event) ->
      if @get('content.isEditing')
        taskController = @get 'content'
        action = {27: 'cancelEditMode', 13: 'save'}[event.keyCode]

        if action
          $(event.target).blur()
          taskController[action]()

    doubleClick: (event) ->
      unless @get('content.isEditing')
        @clearTextSelection()
        @get('content').enterEditMode()



    clearTextSelection: ->
      if window.getSelection
        window.getSelection().removeAllRanges()
      else if document.selection
        document.selection.empty()


