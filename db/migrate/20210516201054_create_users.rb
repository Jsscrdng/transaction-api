class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.string :access_token, null: false, default: ""
      t.string :email
      t.string :first_name
      t.string :last_name

      t.timestamps
    end

    add_index :users, :email,        unique: true
    add_index :users, :access_token, unique: true
  end
end
