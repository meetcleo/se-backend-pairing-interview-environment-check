# frozen_string_literal: true

module Requirements
  # Check that the required Ruby version is being loaded in the environment
  class RubyRequirement < Requirement
    # Load the required Ruby version from the `.ruby-version` file.
    # @return String
    REPO_RUBY_VERSION = File.read('./.ruby-version').to_s.gsub(/[^.\d]+/, '').to_s

    private

    def run_check!
      loaded_ruby_version_is_repo_version?
    end

    def loaded_ruby_version_is_repo_version?
      REPO_RUBY_VERSION == RUBY_VERSION
    end
  end
end
