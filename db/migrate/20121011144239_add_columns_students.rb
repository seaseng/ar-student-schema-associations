require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class AddColumnsStudents < ActiveRecord::Migration
  # def change
  #     add_column  :students, :name, :string
  #     Student.all.each do |student|
  #       student.update_attributes(name: student.name)
  #     end
  #     remove_column :students, :first_name
  #     remove_column :students, :last_name

  #     add_column    :students, :address, :string
  # end

  def up
    add_column  :students, :name, :string
    Student.all.each do |student|
      student.update_attributes(name: student.first_name + ' ' + student.last_name)
    end
    remove_column :students, :first_name
    remove_column :students, :last_name

    add_column    :students, :address, :string
  end

  def down
    add_column :students, :first_name, :string
    add_column :students, :last_name, :string
    Student.all.each do |student|
      split_name = student.name.split(" ")
      student.update_attributes(first_name: split_name[0])
      student.update_attributes(last_name: split_name[1..-1].join(" "))
    end
    remove_column :students, :name
    remove_column :students, :address
  end


end
