class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :appt_name
      t.text :appt_description
      t.datetime :appt_date
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
