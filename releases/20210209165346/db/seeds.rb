# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
User.create!(first_name: 'Niyonkuru',last_name: 'Elisa',email: 'niyonkuruelisa@gmail.com',phone_number:'+250785290539',role: 'admin',password: 'Test@afrodrama.com')
User.create!(first_name: 'Mugenimana',last_name: 'fifi',email: 'fifi@gmail.com',phone_number:'+250785290539',password: 'Test@frodrama.com')
User.create!(first_name: 'Test',last_name: 'Client',email: 'test@gmail.com',phone_number:'+250785290539',role: 'tester',password: 'Test@afrodrama.com')
