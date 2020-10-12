class CreateLocations < ActiveRecord::Migration[6.0]
  def change
    create_table :locations do |t|
      t.string :appt_address
      t.string :appt_city
      t.string :appt_state
      t.float :longitude
      t.float :latitude
      t.belongs_to :user
      t.belongs_to :appointment
      t.timestamps
    end
  end
end
