Todo.TaskTableRowController = Ember.ObjectController.extend
  isEditing: false
  transaction: null

  isNotEditing: Ember.computed ->
    not @get('isEditing')
  .property('isEditing')

  enterEditMode: ->
    @beginTransaction()
    @set 'isEditing', true

  cancelEditMode: ->
    @rollbackTransaction()
    @set 'isEditing', false

  save: ->
    @commitTransaction()
    @set 'isEditing', false



  store: ->
    @get('model.store')

  beginTransaction: ->
    @set 'transaction', @store().transaction()
    @get('transaction').add @get('model')

  rollbackTransaction: ->
    @get('transaction').rollback()


  commitTransaction: ->
    @get('transaction').commit()
