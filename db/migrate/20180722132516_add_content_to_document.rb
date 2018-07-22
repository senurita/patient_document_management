class AddContentToDocument < ActiveRecord::Migration[5.0]
  def change
  	  add_column :documents, :content, :string
  end
end
