class CreateTableAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.string :time
      t.date :date
      t.integer :user_id
      t.integer :service_id
    end
  end
end
