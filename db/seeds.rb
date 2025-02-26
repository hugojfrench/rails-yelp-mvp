# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


puts "Cleaning database..."
Restaurant.destroy_all

puts "Creating restaurants..."
tian_fu = {name: "Tian fu", address: "37-39 Bulwer St, London W12 8AR", phone_number: "07865478543", category: "chinese"}
padella =  {name: "Padella", address: "56 pasta lane, SW6",phone_number: "07964478543", category: "italian"}
wagamama =  {name: "Wagamama", address: "23 katsu corner, SE17",phone_number: "07865394843", category: "japanese"}
le_vacherin = {name: "Le Vacherin", address: "12 Turnham Green Corner, W6", phone_number: "07898576843", category: "french"}
lowlander = {name: "Lowlander", address: "20 Drury Lane, WC2B 5RT",phone_number: "07862039543", category: "belgian"}
rudys = {name: "Rudy's Neopolitan Pizza", address: "22 Dough Avenue, N6", phone_number: "07989078543", category: "italian"}
itsu = {name: "Itsu", address: "13 Sashimi Drive", phone_number: "07283658543", category: "italian"}



[tian_fu, padella, wagamama, le_vacherin, lowlander, rudys, itsu].each do |attributes|
  restaurant = Restaurant.create!(attributes)
  puts "Created #{restaurant.name}"
end
puts "Finished!"
