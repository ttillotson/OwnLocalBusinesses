# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join("db", "50k_businesses.csv"))
csv = CSV.parse(csv_text, headers: true, encoding: 'ISO-8859-1')

csv.each do |row|
    b = Business.new
    b.uuid = row["uuid"]
    b.name = row["name"]
    b.address = row["address"]
    b.address2 = row["address2"]
    b.city = row["city"]
    b.state = row["state"]
    b.zip = row["zip"]
    b.country = row["country"]
    b.phone = row["phone"]
    b.website = row["website"]
    b.created_at = row["created_at"]
    b.save
    puts "#{b.name} saved"
end