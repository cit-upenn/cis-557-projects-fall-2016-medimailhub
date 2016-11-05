# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.new(:email => "jacobv1992@gmail.com", :password => "Jac560037_", :first_name => "Jacob", :last_name => "varghese")
user2 = User.new(:email => "user2@user2.com", :password => "user2user2", :first_name => "User2", :last_name => "user2")
user3 = User.new(:email => "user3@user3.com", :password => "user3user3", :first_name => "User3", :last_name => "user3")
user4 = User.new(:email => "user4@user4.com", :password => "user4user4", :first_name => "User4", :last_name => "user4")
user4 = User.new(:email => "user4@user4.com", :password => "user4user4", :first_name => "User4", :last_name => "user4")
user5 = User.new(:email => "user5@user5.com", :password => "user5user5", :first_name => "User5", :last_name => "user5")
user6 = User.new(:email => "user6@user6.com", :password => "user6user6", :first_name => "User6", :last_name => "user6")
user7 = User.new(:email => "user7@user7.com", :password => "user7user7", :first_name => "User7", :last_name => "user7")
user8 = User.new(:email => "user8@user8.com", :password => "user8user8", :first_name => "User8", :last_name => "user8")
user9 = User.new(:email => "user9@user9.com", :password => "user9user9", :first_name => "User9", :last_name => "user9")

user1.save
user2.save
user3.save
user4.save
user5.save
user6.save
user7.save
user8.save
user9.save


contact2 = Contact.new(:contact_person => user2.id , :contact_name => "#{user2.first_name} #{user2.last_name}")
contact3 = Contact.new(:contact_person => user3.id , :contact_name => "#{user3.first_name} #{user3.last_name}")
contact4 = Contact.new(:contact_person => user4.id , :contact_name => "#{user4.first_name} #{user4.last_name}")
contact5 = Contact.new(:contact_person => user5.id , :contact_name => "#{user5.first_name} #{user5.last_name}")
contact6 = Contact.new(:contact_person => user6.id , :contact_name => "#{user6.first_name} #{user6.last_name}")
contact7 = Contact.new(:contact_person => user7.id , :contact_name => "#{user7.first_name} #{user7.last_name}")
contact8 = Contact.new(:contact_person => user8.id , :contact_name => "#{user8.first_name} #{user8.last_name}")
contact9 = Contact.new(:contact_person => user9.id , :contact_name => "#{user9.first_name} #{user9.last_name}")

user1.contacts << contact2
user1.contacts << contact3
user1.contacts << contact4
user1.contacts << contact5
user1.contacts << contact6
user1.contacts << contact7
user1.contacts << contact8
user1.contacts << contact9