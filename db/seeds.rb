# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user = User.new(:email => "neeraj@dine-media.com", :password => "Neeraj123", :password_confirmation => "Neeraj123", :business_name => "Software", :location => "Bangalore", :phone => "9480018881", :contact_name => "Neeraj Choudhary", :role_type => "super_admin")
user.confirm!
user.save
