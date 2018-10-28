class CreateTickets < ActiveRecord::Migration[5.2]
  def change
    create_table :tickets do |t|
      t.string :place
      t.decimal :price, :precision => 8, :scale => 2
      t.integer :event_id

      t.timestamps
    end
  end
end
