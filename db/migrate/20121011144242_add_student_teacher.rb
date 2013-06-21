require_relative '../config'

# this is where you should use an ActiveRecord migration to 

class AddStudentTeacher < ActiveRecord::Migration

  def change
    create_table    :student_teachers do |t|
      t.integer     :student_id
      t.integer     :teacher_id
    end

  end



  def up
    remove_column :students, :teacher_id
  end

  def down
    add_column  :students, :teacher_id, :integer
    
  end

end
