class RemoveAppointmentIdFromServices < ActiveRecord::Migration
  def change
    remove_column :services, :appointment_id, :integer
  end
end
