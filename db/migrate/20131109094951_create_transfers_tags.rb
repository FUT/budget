class CreateTransfersTags < ActiveRecord::Migration
  def change
    create_table :transfers_tags do |t|
      t.integer :transfer_id
      t.integer :tag_id

      t.timestamps
    end
  end
end
