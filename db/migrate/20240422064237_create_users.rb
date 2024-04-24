class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.string :name, null: false 
      t.string :email, null: false
      t.string :password_digest, null: false
      t.string :position
      t.string :status
      t.boolean :authentication
      t.datetime :last_login_at 
      t.timestamps
    end
  end
end
