# frozen_string_literal: true
require 'bundler'
Bundler.require

require_relative 'lib/requirements'

task :check_requirements do
  [
    Requirements::RubyRequirement.new,
    Requirements::SqliteRequirement.new
  ].each(&:check!)
end

task default: :check_requirements
