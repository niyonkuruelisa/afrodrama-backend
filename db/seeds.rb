# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
# movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
User.create!(firstName: 'Niyonkuru',lastName: 'Elisa',email: 'niyonkuruelisa@gmail.com',phoneNumber:'+250785290539',role: 'admin',password: '12345678')
User.create!(firstName: 'Mugenimana',lastName: 'fifi',email: 'fifi@gmail.com',phoneNumber:'+250785290539',password: '12345678')
User.create!(firstName: 'Test',lastName: 'Client',email: 'test@gmail.com',phoneNumber:'+250785290539',role: 'tester',password: '12345678')
