# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:

# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
# Character.create(name: 'Luke', movie: movies.first)
AdminUser.create!(email: "admin@example.com", password: "password", password_confirmation: "password") if Rails.env.development?

LineItem.destroy_all
ShoppingCart.destroy_all
OrderProduct.destroy_all
Order.destroy_all
Address.destroy_all
Province.destroy_all
Page.destroy_all
Product.destroy_all
Category.destroy_all
DeviseUser.destroy_all

require "net/http"
require "json"

categories = ["Comedy", "Crime", "Drama", "Romance"]

categories.each do |c|
  Category.create(name: c)
end

# comedy_uri = URI("https://raw.githubusercontent.com/mnathuw/E_Commerce_Project-master/main/comedy.json?token=AGPJ2QKWUZRWPKNQOYJ2AI273HEKS")
# crime_uri = URI("https://raw.githubusercontent.com/mnathuw/E_Commerce_Project-master/todo-pic/crime.json?token=AGPJ2QNDW4RLHK5QQQ6GDLS73KJEO")
# drama_uri = URI("https://raw.githubusercontent.com/mnathuw/E_Commerce_Project-master/todo-pic/drama.json?token=AGPJ2QN4Y7M6KD6JNNJDZMC73KJAK")
# romance_uri = URI("https://raw.githubusercontent.com/mnathuw/E_Commerce_Project-master/todo-pic/romance.json?token=AGPJ2QO42SEJGDUUSX33TR273KJCC")

# comedy_response = Net::HTTP.get(comedy_uri)
# crime_response = Net::HTTP.get(crime_uri)
# drama_response = Net::HTTP.get(drama_uri)
# romance_response = Net::HTTP.get(romance_uri)

# comedy = JSON.parse(comedy_response)
# crime = JSON.parse(crime_response)
# drama = JSON.parse(drama_response)
# romance = JSON.parse(romance_response)

# Category.all.each do |cat|
#   comedy.each do |key, value|
#     if value["category"] == cat.name
#       p = Product.create(name: value["name"], description: value["description"], price: value["price"], image: value["img_link"], is_in_stock: true, category_id: cat.id)
#     end
#   end

#   crime.each do |key, value|
#     if value["category"] == cat.name
#       p = Product.create(name: value["name"], description: value["description"], price: value["price"], image: value["img_link"], is_in_stock: true, category_id: cat.id)
#     end
#   end

#   drama.each do |key, value|
#     if value["category"] == cat.name
#       p = Product.create(name: value["name"], description: value["description"], price: value["price"], image: value["img_link"], is_in_stock: true, category_id: cat.id)
#     end
#   end

#   romance.each do |key, value|
#     if value["category"] == cat.name
#       p = Product.create(name: value["name"], description: value["description"], price: value["price"], image: value["img_link"], is_in_stock: true, category_id: cat.id)
#     end
#   end
# end

Page.create(title: "About Ginger Bear", content: "", permalink: "about_us")
Page.create(title: "Contact Us", content: "", permalink: "contact")

prov = [["Alberta", "AB", 0.05, 0.00, 0.00],
        ["British Columbia", "BC", 0.05, 0.07, 0.00],
        ["Manitoba", "MB", 0.05, 0.07, 0.00],
        ["New Brunswick", "NB", 0.05, 0.10, 0.15],
        ["Newfoundland and Labrador", "NL", 0.05, 0.10, 0.15],
        ["Northwest Territories", "NT", 0.00, 0.00, 0.00],
        ["Nova Scotia", "NS", 0.05, 0.10, 0.15],
        ["Nunavut", "NU", 0.00, 0.08, 0.10],
        ["Ontario", "ON", 0.05, 0.08, 0.13],
        ["Prince Edward Island", "PE", 0.00, 0.00, 0.15],
        ["Quebec", "QC", 0.09975, 0.05, 0.14975],
        ["Saskatchewan", "SK", 0.06, 0.05, 0.11],
        ["Yukon", "YT", 0.00, 0.05, 0.05]]

prov.each do |p|
  Province.create(name: p[0], acronym: p[1], P_GST: p[2], P_PST: p[3], P_HST: p[4])
end

