Todo.TaskTableRowController = Ember.ObjectController.extend
  isEditing: false

  isNotEditing: Ember.computed ->
    not @get('isEditing')
  .property('isEditing')

  enterEditMode: ->
    @beginTransaction() unless @get('model.isNew')
    @set 'isEditing', true

  cancelEditMode: ->
    @set 'isEditing', false
    @get('model').deleteRecord() if @get('model.isNew')
    @rollbackTransaction()

  markAsDone: ->
    @set 'isDone', true
    @store().commit()

  save: ->
    if @get('model.isDirty')
      @get('model').one 'didCreate', => @set 'isEditing', false
      @get('model').one 'didUpdate', => @set 'isEditing', false
      @commitTransaction()
    else
      @rollbackTransaction()
      @set 'isEditing', false

  delete: ->
    record = @get('model')
    if confirm 'Are you sure you want to delete ' + record.get('name') + '?'
      record.get('list.tasks').removeObject record # Do I have to do this? Why? ;-(
      record.deleteRecord()
      @commitTransaction()



  store: ->
    @get('model.store')

  beginTransaction:  ->
    @store().transaction().add @get('model')

  rollbackTransaction: ->
    @get('model.transaction').rollback()

  commitTransaction: ->
    @get('model.transaction').commit()
