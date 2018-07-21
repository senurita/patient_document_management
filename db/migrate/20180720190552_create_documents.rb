class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :url
      t.string :file_name
      t.string :type

      t.timestamps
    end
  end
end
