# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Ticket.destroy_all
Session.destroy_all
Room.destroy_all
Movie.destroy_all
Purchase.destroy_all
User.destroy_all
Theater.destroy_all

User.create!(name: "Raphael Pinheiro de Souza",
			age: 17,
			email: "raphael.pinheiro.souza@gmail.com",
			password: "xingling",
			student: true
	)
#Inserting template
Template.create!(col: 4, row: 5)

#Inserting users
20.times do |n|
  #Fake data
  name  = Faker::Name.name
  email = "user-#{n+1}@gmail.com"
  password = "password"
  student = Faker::Boolean.boolean
  age = Faker::Number.between(15, 30)

  #Insert user
  User.create!(name: name,email: email, age: age,
				password: password, student: student)
end

#Inserting Movie
10.times do |n|
  title  = Faker::Book.title[0...19]
  censorship = Faker::Number.between(12, 21)
  plot = Faker::Lorem.sentence
  #Insert Movie
  Movie.create!(title: title, censorship: censorship, storyline: plot)
end

#Inserting Theater
3.times do |n|
	name = "Rialto #{n}"
	address = Faker::Address.street_address
	#Insert Theater
	Theater.create!(name: name, address: address)
end

#Creating rooms to theaters
theaters = Theater.all

5.times do |r|
	theaters.each do |t|
		template = Template.where(:id => 1)
		col = template[0].col
		row = template[0].row
		t.rooms.create!(capacity: col*row, template_id: 1)
	end
end

#Inserting 3 Sessions for each movie
movies = Movie.all
rooms = Room.all
room = rooms[0]
3.times do |session|
	movies.each do |m|
		m.sessions.create!(
			room_id: room.id,
			date: Faker::Date.forward(10),
			price: Faker::Number.decimal(2)
		)
	end
end

#Inserting Tickets for each User
users = User.all
users.each do |u|
	session = Session.all[rand(Session.count)]
	p = Purchase.create!(
			total: u.student ? session.price/2 : session.price,
			user_id: u.id
		)
	row = Faker::Number.between(1,4)
	col = Faker::Number.between(1,4)
	sit = "#{row}-#{col}"
	p.tickets.create!(status: Faker::Boolean.boolean,
			price: u.student ? session.price/2 : session.price,
			session_id: session.id,
			chair: sit
		)
end

