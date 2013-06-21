require_relative '../../db/config'

class Student < ActiveRecord::Base
  has_many :student_teachers, :foreign_key => :student_id
  has_many :teachers, :through => :student_teachers

# implement your Student model here
  # validates_format_of :phone, :with => /^[\\(]{0,1}([0-9]){3}[\\)]{0,1}[ ]?([^0-1]){1}([0-9]){2}[ ]?[-]?[ ]?([0-9]){4}[ ]*((x){0,1}([0-9]){1,5}){0,1}$/
  # validates_format_of :email, :with => /^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$/
  # validates_numericality_of :age, :greater_than => 5
  # validates :email, :uniqueness => true

  # def name
  #   first_name + ' ' + last_name
  # end

  def age
    now = Date.today
    age = now.year - birthday.year - ((now.month > birthday.month || (now.month == birthday.month && now.day >= birthday.day)) ? 0 : 1)   
  end
end
