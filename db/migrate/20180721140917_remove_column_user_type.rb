class RemoveColumnUserType < ActiveRecord::Migration[5.0]
  def change
  	remove_column :user_types, :value

  end
end
