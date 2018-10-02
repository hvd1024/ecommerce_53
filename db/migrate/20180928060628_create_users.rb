class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.integer :role, default: 0
      t.string :name
      t.string :phone
      t.string :address
      t.string :email
      t.string :password

      t.timestamps
    end
  end
end
