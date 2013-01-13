require 'will_paginate/array'

module SpreeSite
  class Engine < Rails::Engine
    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../app/**/*_decorator*.rb")) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end

      [Calculator::ZonesAndWeight].each{|c_model|
        begin
          c_model.register if c_model.table_exists?
        rescue Exception => e
          $stderr.puts "Error registering calculator #{c_model}"
        end
      }
    end
    
    def load_tasks
    end
    
    config.to_prepare &method(:activate).to_proc
  end
end