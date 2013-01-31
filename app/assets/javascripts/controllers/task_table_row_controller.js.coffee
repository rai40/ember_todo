Todo.TaskTableRowController = Ember.ObjectController.extend
  isEditing: false
  transaction: null

  isNotEditing: Ember.computed ->
    not @get('isEditing')
  .property('isEditing')

  enterEditMode: (transaction) ->
    @beginTransaction transaction
    @set 'isEditing', true

  cancelEditMode: ->
    @set 'isEditing', false
    @get('model').deleteRecord() if @get('model.isNew')
    @rollbackTransaction()

  markAsDone: ->
    @set 'isDone', true
    @store().commit()

  save: ->
    @commitTransaction()
    @set 'isEditing', false

  delete: ->
    record = @get('model')
    if confirm 'Are you sure you want to delete ' + record.get('name') + '?'
      record.get('list.tasks').removeObject record # Do I have to do this? Why? ;-(
      record.deleteRecord()
      @commitTransaction()



  store: ->
    @get('model.store')

  beginTransaction: (transaction) ->
    @set 'transaction', transaction || @store().transaction()
    @get('transaction').add @get('model')

  rollbackTransaction: ->
    @get('transaction').rollback()


  commitTransaction: ->
    @get('transaction').commit()
