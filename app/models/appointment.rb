class Appointment < ApplicationRecord
  belongs_to :principal, :class_name => 'Student', :foreign_key => 'id'
  belongs_to :partner, :class_name => 'Student', :foreign_key => 'id', optional: true
end
