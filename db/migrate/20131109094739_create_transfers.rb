class CreateTransfers < ActiveRecord::Migration
  def change
    create_table :transfers do |t|
      t.integer :user_id
      t.integer :amount
      t.string :title
      t.integer :description

      t.timestamps
    end
  end
end
