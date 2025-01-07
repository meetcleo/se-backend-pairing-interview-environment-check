# frozen_string_literal: true

module Requirements
  # Sets up a Sqlite database and ensures that we can read and write data.
  class SqliteRequirement < Requirement
    require 'sqlite3'
    require 'active_record'

    # A test ActiveRecord class to read/write data for
    class Foo < ActiveRecord::Base
      self.table_name = 'foo_bars'
      belongs_to :bar, class_name: 'Bar', foreign_key: 'owner_id'
    end

    # A test ActiveRecord class to read/write data for
    class Bar < ActiveRecord::Base
      self.table_name = 'foo_bars'
      has_one :foo, class_name: 'Foo', foreign_key: 'owner_id'
    end

    private

    def run_check!
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
        create_table 'foo_bars', force: true do |t|
          t.string 'name'
          t.integer 'owner_id'
          t.string 'type'
          t.datetime 'created_at'
          t.datetime 'updated_at'
        end
      end
    end
  end
end
