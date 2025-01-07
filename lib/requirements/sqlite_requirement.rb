# frozen_string_literal: true

module Requirements
  require_relative 'requirement'
  class SqliteRequirement < Requirement
    require 'sqlite3'
    require 'active_record'

    class Foo < ActiveRecord::Base
      belongs_to :bar
    end

    class Bar < ActiveRecord::Base
      has_one :foo
    end

    private

    def run_check!
      can_write_and_read_sqlite?
    end

    def can_write_and_read_sqlite?
      build_database_schema!
      can_write_records_to_database? and can_read_records_from_database?
    end

    def can_read_records_from_database?
      Bar.joins(:foo).exists?
    end

    def can_write_records_to_database?
      bar = Bar.create!(name: 'Bar 1')
      Foo.create!(name: 'Foo 1', bar: bar)
      true
    rescue ActiveRecord
      false
    end

    def database_connection
      unless ActiveRecord::Base.connected?
        ActiveRecord::Base.establish_connection({
                                                  adapter: 'sqlite3',
                                                  database: 'db/development.sqlite3'
                                                })
      end
      ActiveRecord::Base.connection
    end

    def build_database_schema!
      database_connection.instance_eval do
        create_table 'foos', force: true do |t|
          t.string 'name'
          t.integer 'bar_id'
          t.datetime 'created_at'
          t.datetime 'updated_at'
        end

        create_table 'bars', force: true do |t|
          t.string 'name'
          t.datetime 'created_at'
          t.datetime 'updated_at'
        end
      end
    end
  end
end
