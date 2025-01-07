# frozen_string_literal: true

require 'bundler/inline'
$LOAD_PATH << File.join(File.dirname(__FILE__), 'lib')
require 'requirements/ruby_requirement'
require 'requirements/sqlite_requirement'

task :check_requirements do
  [
    Requirements::RubyRequirement.new,
    Requirements::SqliteRequirement.new
  ].each(&:check!)
end

task default: :check_requirements
