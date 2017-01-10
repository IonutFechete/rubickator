class History < ApplicationRecord
  belongs_to :principal, :class_name => 'Student', :foreign_key => 'principal_id'
  belongs_to :partner, :class_name => 'Student', :foreign_key => 'student_id', optional: true
end
