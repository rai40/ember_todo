Todo.TaskTableRowController = Ember.ObjectController.extend
  needs: ['regrets']
  isEditing: false

  isNotEditing: Ember.computed ->
    not @get('isEditing')
  .property('isEditing')

  enterEditMode: ->
    return if @get('isEditing')

    @beginTransaction() unless @get('model.isNew')
    @set 'isEditing', true

  cancelEditMode: ->
    return unless @get('isEditing')
    @set 'isEditing', false
    @get('model').deleteRecord() if @get('model.isNew')
    @rollbackTransaction()

  markAsDone: ->
    @set 'isDone', true
    @store.commit()

  save: ->
    if @get('model.isDirty')
      @get('model').one 'didCreate', => @set 'isEditing', false
      @get('model').one 'didUpdate', => @set 'isEditing', false
      @commitTransaction()
    else
      @rollbackTransaction()
      @set 'isEditing', false

  delete: ->
    record = @get 'model'
    tasks = record.get('list.tasks')

    @get('controllers.regrets').deleteWithRegret record,
      transaction: @get('model.transaction')
      onSetupRegret: => tasks.removeObject record # Do I have to do this? Why? ;-(
      onRegret: => tasks.pushObject record

  beginTransaction:  ->
    @store.transaction().add @get('model')

  rollbackTransaction: ->
    @get('model.transaction').rollback()

  commitTransaction: ->
    @get('model.transaction').commit()
