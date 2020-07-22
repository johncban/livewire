class CreatePosts < ActiveRecord::Migration[6.0]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :description
      t.boolean :public
      t.references :user, null: false, foreign_key: true
      t.references :appointment, null: false, foreign_key: true
      t.references :portfolio, null: false, foreign_key: true
    end
  end
end
