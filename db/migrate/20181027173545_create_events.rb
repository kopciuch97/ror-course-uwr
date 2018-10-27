class CreateEvents < ActiveRecord::Migration[5.2]
  def change
    create_table :events do |t|
      t.string :name
      t.text :content
      t.string :city
      t.datetime :date

      t.timestamps
    end
  end
end
