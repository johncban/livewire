class ActsAsCommentableWithThreadingMigration < ActiveRecord::Migration[6.0]
  def self.up
    create_table :comments, force: true do |t|
      t.integer :commentable_id
      t.string :commentable_type
      t.string :title
      t.text :body
      t.string :subject
      t.belongs_to :user
      t.belongs_to :post
      # t.integer :user_id, :null => false
      t.integer :parent_id, :lft, :rgt
      t.timestamps
    end

    # add_index :comments, :user_id
    add_index :comments, %i[commentable_id commentable_type]
  end

  def self.down
    drop_table :comments
  end
end
