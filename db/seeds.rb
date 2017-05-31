# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
if !Admin.exists?(email: 'admin@example.com')
  Admin.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password')
end

%w(Running Pushups).each do |type|
  ChallengeCategory.find_or_create_by name: type
end

%w(Running Pushups).each do |type|
  ExerciseCategory.find_or_create_by name: type
end

%w(Follows Challenges Events Activities Friends).each do |name|
  NotificationType.find_or_create_by name: name
end
