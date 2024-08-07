# frozen_string_literal: true

require_relative 'config/application'

Rails.application.load_tasks

# Set up Rspec task
if (rspec_loaded = defined?(RSpec))
  task(:spec).clear
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.verbose = false
    t.rspec_opts = '--profile'
  end
end

# Set up Rubocop tasks
require 'rubocop/rake_task'
RuboCop::RakeTask.new(:rubocop) do |t|
  t.options = [
    '--autocorrect-all',
    '--cache=true',
    '--display-cop-names',
    '--display-time',
    '--parallel'
  ]
end

RuboCop::RakeTask.new(:rubocop_changed) do |t|
  globs = "'*.rb' '*.rake' 'Rakefile' ':!db' ':!bin' ':!config'"
  staged_files = `git diff --cached --name-only -- #{globs}`.split("\n")
  changed_files = `git diff --name-only $(git merge-base master HEAD) -- #{globs}`.split("\n")
  t.options = ['--display-cop-names', '--autocorrect-all'] + staged_files + changed_files
end

# Set up default task(s)
task(:default).clear
task default: [:rubocop] + (rspec_loaded ? [:spec] : [])
