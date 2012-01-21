# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{ username: 'admin', salt: '', password: 'admin', is_super_admin: true },
                     { username: 'developer', salt: '', password: 'developer' }])

profiles = UserProfile.create([{ user: users.first, surname: "Doe", given_names: "John",
                                 gender: 0, phone: "444-444", mail: "admin@st.com" },
                               { user: users.last, surname: "Doe", given_names: "Nick",
                                 gender: 0, phone: "444-444", mail: "nick@st.com" }])

developers = Developer.create({ user: users.last, busy: 0 })

stories = Story.create({ name: 'Task 1', description: 'Test description.' })