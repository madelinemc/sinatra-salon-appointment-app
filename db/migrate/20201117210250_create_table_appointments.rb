class CreateTableAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.time :time
      t.date :date
      t.integer :user_id
      t.integer :service_id
    end
  end
end
