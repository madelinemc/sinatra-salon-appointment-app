class RemoveAppointmentIdFromUsers < ActiveRecord::Migration
  def change
    remove_column :users, :appointment_id, :integer
  end
end
