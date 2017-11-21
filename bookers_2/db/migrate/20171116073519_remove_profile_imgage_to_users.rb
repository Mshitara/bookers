class RemoveProfileImgageToUsers < ActiveRecord::Migration[5.1]
  def change
  	remove_column :users, :profile_imgage, :string
  end
end
