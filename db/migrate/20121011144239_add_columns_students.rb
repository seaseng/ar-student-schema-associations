require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class AddColumnsStudents < ActiveRecord::Migration
  def change
      add_column  :students, :name, :string
      Student.all.each do |student|
        student.update_attributes(name: student.name)
      end
      remove_column :students, :first_name
      remove_column :students, :last_name

      add_column    :students, :address, :string
  end
end
