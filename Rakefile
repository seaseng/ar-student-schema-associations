
require_relative 'db/config'
require_relative 'lib/students_importer'



desc "create the database"
task "db:create" do
  touch 'db/ar-students.sqlite3'
end

desc "drop the database"
task "db:drop" do
  rm_f 'db/ar-students.sqlite3'
end

desc "migrate the database (options: VERSION=x, VERBOSE=false, SCOPE=blog)."
task "db:migrate" do
  ActiveRecord::Migrator.migrations_paths << File.dirname(__FILE__) + 'db/migrate'
  ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true
  ActiveRecord::Migrator.migrate(ActiveRecord::Migrator.migrations_paths, ENV["VERSION"] ? ENV["VERSION"].to_i : nil) do |migration|
    ENV["SCOPE"].blank? || (ENV["SCOPE"] == migration.scope)
  end
end

# desc "populate the test database with sample data"
# task "db:populate" do
#   StudentsImporter.import
# end

desc "populate the test database with sample data"
task "db:seed_students" do
  # StudentsImporter.import
  54.times do
    student = Student.new
    student.name = Faker::Name.name
    student.gender = ['Male', 'Female'].sample
    student.birthday = Date.new(rand(1950..2012), rand(1..12), rand(1..28))
    student.email = Faker::Internet.email
    student.phone = Faker::PhoneNumber.phone_number
    student.address = Faker::Address.street_address
    student.save!
  end

end


desc "populate the test database with sample teachers"
task "db:seed_teachers" do
  9.times do 
    teacher = Teacher.new
    teacher.name = Faker::Name.name
    teacher.phone_number = Faker::PhoneNumber.phone_number
    teacher.email = Faker::Internet.email
    teacher.save!
  end

end

desc "assign student to teachers equally"
task "db:assign_students" do
  teacher_ids = Teacher.pluck(:id)
  student_ids = Student.pluck(:id)

  Student.all.each do |student|
    student.teacher_id = teacher_ids.sample
    student.save
  end

  # 100.times do
  #   StudentTeacher.create(teacher_id: ids1.sample, student_id: ids2.sample)
  # end

end


desc "assign student teacher table"
task "db:assign" do
  teacher_ids = Teacher.pluck(:id)
  student_ids = Student.pluck(:id)

  50.times do
    StudentTeacher.create(teacher_id: teacher_ids.sample, student_id: student_ids.sample)
  end

end




desc 'Retrieves the current schema version number'
task "db:version" do
  puts "Current version: #{ActiveRecord::Migrator.current_version}"
end

desc "Run the specs"
RSpec::Core::RakeTask.new(:specs)

task :default  => :specs
