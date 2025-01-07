module Requirements
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
    end
  end
end