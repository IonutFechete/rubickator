class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception


  def principal_appointment
    @suggested = suggest_principal_for_appointment
  end

  def group_appointment
    @suggested_principal = suggest_principal_for_group_appointment
    @suggested_student = suggest_partner_for_group_appointment
  end

  def reset_cycle
    Appointment.delete_all
  end
  private

  def appointments_count
    @appointments_count ||= Appointment.count
  end

  def suggest_principal_for_group_appointment
    Student.includes(:principal_appointments).where("student.sex = 'f' AND principal_appointments.principal_id IS NULL").limit(1).offset(rand(appointments_count)).first
  end

  def suggest_partner_for_group_appointment
    Student.includes(:partner_appointments).where("student.sex = 'f' AND partner_appointments.student_id IS NULL").limit(1).offset(rand(appointments_count)).first
  end

  def suggest_principal_for_appointment
    Student.includes(:principal_appointments).where("student.sex = 'm' AND principal_appointments.principal_id IS NULL").limit(1).offset(rand(appointments_count)).first
  end
end
