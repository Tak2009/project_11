class CreateUsers < ActiveRecord::Migration[6.0]
  def change
    create_table :users do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :ip_address
      t.float :latitude
      t.float :longitude
      t.float :result
      t.references :city, null: false, foreign_key: true

      t.timestamps
    end
  end
end
