class Student < ApplicationRecord
  has_many :principal_appointments, :class_name => "Appointment", :foreign_key => "principal_id"
  has_many :partner_appointments, :class_name => "Appointment", :foreign_key => "student_id"
  has_many :principal_appointments_histories, :class_name => "History", :foreign_key => "principal_id"
  has_many :partner_appointments_histories, :class_name => "History", :foreign_key => "student_id"

  def had_appointment_this_cycle
    self.principal_appointments.order("created_on DESC").first
  end

  def was_a_partner_this_cycle
    raise MalesCannotBeStudents if self.sex == 'm'

    self.partner_appointments.order("created_on DESC").first
  end
end

class MalesCannotBeStudents < StandardError; end
