Todo.RegretController = Ember.ObjectController.extend
  needs: ['regrets']
  regretTimer: null
  regretOptions: {}

  # Set up a regret to expire
  #
  # Options:
  #   seconds:        How long regret time? Default: 5.
  #   onRegret:       Callback to be done if the user is regretting.
  expireAfter: (options = {}) ->
    throw "Already been scheduled to expire!" if @get 'regretTimer'
    throw "Needs to know how long regret time we should have!" if options.seconds is undefined

    @set 'regretOptions', options
    @set 'regretTimer', Ember.run.later (=> @expire()), options.seconds * 1000


  regret: ->
    Ember.run.cancel @get('regretTimer') if @get('regretTimer')
    @get('controllers.regrets').removeObject @

    if callback = @get('regretOptions.onRegret') then callback()

    @get('model.transaction').rollback()

  expire: ->
    @get('controllers.regrets').removeObject @
    @get('model.transaction').commit()
