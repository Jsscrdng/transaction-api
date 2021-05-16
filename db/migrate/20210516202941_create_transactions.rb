class CreateTransactions < ActiveRecord::Migration[6.0]
  def change
    create_table :transactions do |t|
      t.references :origin_account, null: false, foreign_key: { to_table: 'accounts' }
      t.references :destination_account, null: false, foreign_key: { to_table: 'accounts' }
      t.float :amount
      t.text :description

      t.timestamps
    end
  end
end
