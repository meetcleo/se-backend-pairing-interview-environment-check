# frozen_string_literal: true

module Requirements
  # Base class for a requirement check
  # Will print output whether check passes or fails. Individual checks are defined as
  # subclasses
  #
  class Requirement
    require 'colorize'
    OK = 'OK'.colorize(:green)
    FAIL = 'FAIL'.colorize(:red)

    def check!
      if run_check!
        puts "Passed requirement check: #{requirement_name} - [#{OK}]"
      else
        puts "Failed requirement check: #{requirement_name} - [#{FAIL}]"
      end
    end

    protected

    def requirement_name
      self.class.to_s.split('::').last.gsub(/Requirement$/, '')
    end

    private

    def run_check!
      # noop
    end
  end
end
