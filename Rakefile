# frozen_string_literal: true

require_relative 'config/application'

Rails.application.load_tasks

if defined? RSpec
  task(:spec).clear
  RSpec::Core::RakeTask.new(:spec) do |t|
    t.verbose = false
    t.rspec_opts = '--profile'
  end

  task(:default).clear
  task default: [:spec]
end
