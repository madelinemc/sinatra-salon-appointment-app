class CreateTableServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.text :description
      t.integer :price
      t.integer :appointment_id
    end
  end
end
