module Requirements
  require_relative 'requirement'
  class RubyRequirement < Requirement

    REPO_RUBY_VERSION = File.read('./.ruby-version').to_s.gsub(/[^.\d]+/,'').to_s


    private

    def run_check!
      loaded_ruby_version_is_repo_version?
    end

    def loaded_ruby_version_is_repo_version?
      REPO_RUBY_VERSION == RUBY_VERSION
    end
  end
end