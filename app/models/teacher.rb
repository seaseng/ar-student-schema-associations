require_relative '../../db/config'
require 'date'

class Teacher < ActiveRecord::Base

  has_many :students, :foreign_key => :student_id

  validates :name, :email, :phone_number, :presence => true
  validates :email, :uniqueness => true



end
