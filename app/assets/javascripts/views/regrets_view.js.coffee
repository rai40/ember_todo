Todo.RegretsView = Ember.CollectionView.extend
  contentBinding: 'controller'

  itemViewClass: Ember.View.extend
    templateName: 'regret'
    classNames: ['regret', 'alert']
