class AddColumnsToBook < ActiveRecord::Migration[5.1]
  def change
  	add_column :books, :title, :string
  	add_column :books, :opinion, :string
  	add_column :books, :user_id, :integer
  	add_column :books, :user_profile_image, :string
  end
end
