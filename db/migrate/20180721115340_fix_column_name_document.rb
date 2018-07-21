class FixColumnNameDocument < ActiveRecord::Migration[5.0]
  def change
  	rename_column :documents, :type, :category

  end
end
