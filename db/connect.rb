require 'rubygems'
require 'active_record'
ActiveRecord::Base.establish_connection(
  adapter: 'mysql2',
  host: 'localhost',
  database: 'buymore_development'
)

class Rubyist < ActiveRecord::Base
end
