# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

v1 = Vertical.create(name: "Health & Fitness")
v2 = Vertical.create(name: "Business")
v3 = Vertical.create(name: "Music")

c1 = Category.create(name: "Booty & Abs", state: "active", vertical_id: v1.id)
c2 = Category.create(name: "Full Body", state: "active", vertical_id: v1.id)
c3 = Category.create(name: "Advertising", state: "active", vertical_id: v2.id)
c4 = Category.create(name: "Writing", state: "active", vertical_id: v2.id)
c5 = Category.create(name: "Singing", state: "active", vertical_id: v3.id)
c6 = Category.create(name: "Music Fundamentals", state: "active", vertical_id: v3.id)

Course.create(name: "Loose the Gutt, keep the Butt", author: "Anowa", state: "active", category_id: c1.id)
Course.create(name: "BrittneBabe Fitness Transformation", author: "BrittneBabe", state: "active", category_id: c1.id)
Course.create(name: "BTX: Body Transformation Extreme", author: "Barstarzz", state: "active", category_id: c2.id)
Course.create(name: "Facebook Funnel Marketing", author: "Russell Brunson", state: "active", category_id: c2.id)
Course.create(name: "Build a Wild Audience", author: "Tim Nilson", state: "active", category_id: c3.id)
Course.create(name: "Editorial Writing Secrets", author: "J. K. Rowling", state: "active", category_id: c4.id)
Course.create(name: "Scientific Writing", author: "Stephen Hawking", state: "active", category_id: c4.id)
Course.create(name: "Vocal Training 101", author: "Linkin Park", state: "active", category_id: c5.id)
Course.create(name: "Music Production", author: "Lady Gaga", state: "active", category_id: c5.id)
Course.create(name: "Learn the Piano", author: "Lang Lang", state: "active", category_id: c6.id)
Course.create(name: "Become a Guitar Hero", author: "Jimmy Page", state: "active", category_id: c6.id)