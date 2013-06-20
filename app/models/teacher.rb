require_relative '../../db/config'
require 'date'

class Teacher < ActiveRecord::Base

  validates :name, :email, :phone_number :presence => true
  # validates :email, :uniqueness => true
  # has_and_belongs_to_many :students


end
