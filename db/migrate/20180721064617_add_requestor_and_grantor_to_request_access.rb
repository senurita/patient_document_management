class AddRequestorAndGrantorToRequestAccess < ActiveRecord::Migration[5.0]
  def change
    add_reference :request_accesses, :requestor
    add_reference :request_accesses, :grantor

  end
end
