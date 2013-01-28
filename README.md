Ember TODO - Ember v.1.0.0-pre4
===============================

This is an example app of Ember, version 1.0.0-pre4.
We are using the new router and this app should be a demonstration
to closely represent how the final APIs will work.

The app is rather simple. It has todo objects and all todos belongs to a list.
As of writing, we are using fixtures as our backend, but I guess I'll flip over
to the REST adapter soon.

I have made some tags on this repo to mark "milestones".


Can I see it up and running?
----------------------------
Yes you can. At the moment is up and running here: http://ember-todo.skalar.no/.


What is missing?
----------------
* Complete-all-button, or other bulk-update things.
* Validations.
* Drop the confirm delete, and instead implement an undo feature like Gmail.
* JS tests.
* Sort todo list by dragging rows.
* Drag and drop tasks from one list to another.
* There is a strange bug when you delete lists. Lists are deleted on server, but stays in client. Refresh and its gone.
* .. + more things to learn Ember :-)


How to get started
------------------

```
..clone..
bundle install
rake db:create
rake db:migrate
rake db:seed
rails s
```
