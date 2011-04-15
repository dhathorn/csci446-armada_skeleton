class CreateBattleships < ActiveRecord::Migration
  def self.up
    create_table :battleships do |t|
      t.string :name
      t.text :description
      t.integer :user_id
      t.integer :cost
      add_column :users, :image_file_name,    :string
      add_column :users, :image_content_type, :string
      add_column :users, :image_file_size,    :integer
      add_column :users, :image_updated_at,   :datetime

      t.timestamps
    end
  end

  def self.down
    drop_table :battleships
  end
end
