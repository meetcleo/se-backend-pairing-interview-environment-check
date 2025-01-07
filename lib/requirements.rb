# frozen_string_literal: true

# Classes defined in here check the local development environment is able to run
# required tools. Each class should encapsulate a single check
module Requirements
  require_relative 'requirements/requirement'
  require_relative 'requirements/ruby_requirement'
  require_relative 'requirements/sqlite_requirement'
end
