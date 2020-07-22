class CreateAppointments < ActiveRecord::Migration[6.0]
  def change
    create_table :appointments do |t|
      t.string :name
      t.text :description
      t.datetime :appointment_date
      t.boolean :public
      t.references :location, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
    end
  end
end
