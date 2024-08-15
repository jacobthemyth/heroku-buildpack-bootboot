# frozen_string_literal: true

require File.expand_path("config/environment", __dir__)

require "hatchet/tasks"
require "rspec/core/rake_task"
require "tempfile"

desc "Run specs"
RSpec::Core::RakeTask.new(:spec) do |t|
  t.rspec_opts = %w[-fs --color]
end
task default: :spec
