class CreateRequestAccesses < ActiveRecord::Migration[5.0]
  def change
    create_table :request_accesses do |t|
      t.string :status

      t.timestamps
    end
  end
end
