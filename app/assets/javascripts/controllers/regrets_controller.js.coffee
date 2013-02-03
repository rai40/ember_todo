Todo.RegretsController = Ember.ArrayController.extend
  content: []
  itemController: 'regret'

  # Set up a deletion for an object, with the option for the user in the UI to regret.
  #
  # By default we begin a transaction on the record before we do anything, so we are
  # able to rollback on regret.
  #
  # Every to-be-deleted records is wrapped in a regret controller wich holds the state
  # per regret.
  #
  # Options:
  #   seconds:          How long regret time? Default: 5.
  #   transaction:      If you have already started a transaction for the record you should provide it here.
  #   onSetupRegret:    Callback to do when we set up the regret.
  #   onRegret:         Callback to be done if the user is regretting.
  deleteWithRegret: (object, options = {}) ->
    transaction = options.transaction || @store.transaction()
    transaction.add object

    object.deleteRecord()
    if callback = options.onSetupRegret then callback()

    @pushObject object

    options.seconds ?= 5
    @regretFor(object).expireAfter options


  regretFor: (object) -> @find (regretController) -> regretController.content == object
  regret: (regret) -> regret.regret()
