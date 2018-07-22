class AddDocumentToRequestAccess < ActiveRecord::Migration[5.0]
  def change
    add_reference :request_accesses, :document, foreign_key: true
  end
end
