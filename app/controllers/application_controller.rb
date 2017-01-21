class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  def index

  end

  def propose_group
    @principal = suggest_principal_for_group_appointment
    found = false
    while !found
      @partner = suggest_partner_for_group_appointment
      found = true if @principal != @partner
    end
  end

  def propose_single
    @principal = suggest_principal_for_appointment
  end

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

  def group_principals
    @group_principals ||= Student.joins('LEFT JOIN "appointments" ON "appointments"."principal" = "students"."id"').where("students.sex = 'f' AND appointments.principal IS NULL")
  end

  def group_partners
    @group_partners ||= Student.joins('LEFT JOIN "appointments" ON "appointments"."principal" = "students"."id"').where("students.sex = 'f' AND appointments.principal IS NULL")
  end

  def single_principals
    @single_principals ||= Student.joins('LEFT JOIN "appointments" ON "appointments"."principal" = "students"."id"').where("students.sex = 'm' AND appointments.principal IS NULL")
  end

  def count_group_principals
    group_principals.count
  end

  def count_single_principals
    single_principals.count
  end

  def count_group_partners
    group_partners.count
  end

  def suggest_principal_for_group_appointment
    group_principals.offset(rand(count_group_principals)).first
  end

  def suggest_partner_for_group_appointment
    group_partners.offset(rand(count_group_partners)).first
  end

  def suggest_principal_for_appointment
    single_principals.offset(rand(count_single_principals)).first
  end
end
