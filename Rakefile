# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require File.expand_path('../config/application', __FILE__)
require 'rake'
require 'rake/testtask'
require 'rdoc/task'

# add this (and perhaps make it conditional on Rails.version if you like):
Rake.application.options.ignore_deprecate = true

Quizapp::Application.load_tasks
