class AddUniqueEmailToUsers < ActiveRecord::Migration[7.1]
  def change
    # Add the new unique email field
    add_column :users, :unique_email, :string
    # Migrate existing email data to the new unique_email field
    User.find_each do |user|
      user.update(unique_email: user.email)
    end
    # Remove the existing email field
    remove_column :users, :email
    # Rename the unique_email field to email
    rename_column :users, :unique_email, :email
    # Add a unique index to the email field
    add_index :users, :email, unique: true
  end
end
