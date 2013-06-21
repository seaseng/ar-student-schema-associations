require_relative '../../db/config'


class Teacher < ActiveRecord::Base

  has_many :student_teachers, :foreign_key => :teacher_id
  has_many :students, :through => :student_teachers

  validates :name, :email, :phone_number, :presence => true
  validates :email, :uniqueness => true

end
