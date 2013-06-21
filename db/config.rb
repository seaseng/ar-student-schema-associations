require 'active_record'
require 'date'
require 'rake'
require 'rspec/core/rake_task'
require_relative '../app/models/teacher'
require_relative '../app/models/student'
require_relative '../app/models/student_teacher'

# Dir["../app/models/*.rb"].each {|file| require file }
require 'faker'

ActiveRecord::Base.establish_connection(:adapter => 'sqlite3', :database => "#{File.dirname(__FILE__)}/../db/ar-students.sqlite3")
