class SetDefaultValueRequestAccess < ActiveRecord::Migration[5.0]
  def change
  	    change_column :request_accesses, :status, :string, default: "pending"
  end
end
