require 'rspec'
require_relative '../app/models/teacher'


describe Teacher, "validations" do

  it "should have unique emails" do
    teacher = Teacher.new
    teacher.update_attributes(
      :name => "Jane Doe",
      :email => "jane.doe@example.com",
      :phone_number => "510-555-1212",
      )
    

    copy_teacher = Teacher.new
    
    copy_teacher.update_attributes(
      :name => "Mark Doe",
      :email => "jane.doe@example.com",
      :phone_number => "510-555-3333",
      )
    
  end
  it {should_not be_valid}
end
