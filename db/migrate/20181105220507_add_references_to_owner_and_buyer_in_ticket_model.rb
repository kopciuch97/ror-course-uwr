class AddReferencesToOwnerAndBuyerInTicketModel < ActiveRecord::Migration[5.2]
  def change
    add_column :tickets, :owner_id, :integer
    add_column :tickets, :bought_by, :integer
    remove_column :tickets, :user_id
  end
end
