class RenameColumnsInTicketTable < ActiveRecord::Migration[5.2]
  def change
    rename_column :tickets, :bought_by, :bought_by_id
  end
end
