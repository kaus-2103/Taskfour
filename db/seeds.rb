# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# db/seeds.rb

# Create an admin user
begin
  users = [
    {
      name: "admin",
      password: "admin",
      password_confirmation: "admin",
      email: "admin@admin.com",
      status: "Active",
      authentication: true,
      position: "admin"
    },
    {
      name: "user1",
      password: "password1",
      password_confirmation: "password1",
      email: "user1@example.com",
      status: "Active",
      authentication: true,
      position: "user"
    },
    {
      name: "user2",
      password: "password1",
      password_confirmation: "password1",
      email: "user2@example.com",
      status: "Active",
      authentication: false,
      position: "user"
    },
    {
      name: "user3",
      password: "password1",
      password_confirmation: "password1",
      email: "user3@example.com",
      status: "Active",
      authentication: false,
      position: "user"
    },
    {
      name: "user4",
      password: "password1",
      password_confirmation: "password1",
      email: "user4@example.com",
      status: "Active",
      authentication: false,
      position: "user"
    }
    # Add more user hashes as needed
  ]

  users.each do |user_params|
    User.create!(user_params)
    puts "User '#{user_params[:name]}' created successfully!"
  end
rescue StandardError => e
  puts "Error creating user: #{e.message}"
end
