class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :appt_name
      t.text :appt_description
      t.datetime :appt_date
      t.string :appt_address
      t.string :appt_city
      t.string :appt_state
      t.float :longitude
      t.float :latitude
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
