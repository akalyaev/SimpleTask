# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

users = User.create([{ username: 'admin',
                       salt: '$2a$10$lEVoakzEp/Nwu8NPmEuHNe',
                       password: '$2a$10$lEVoakzEp/Nwu8NPmEuHNe9bCT2CY2oieP06E/DDSrsp...',
                       is_super_admin: true },
                     { username: 'developer1',
                       salt: '$2a$10$8W6NBrAFMVIH24CY9.04rO',
                       password: '$2a$10$8W6NBrAFMVIH24CY9.04rO19BJ9zL2Cg8EM.CvkUyX4/...' },
                     { username: 'developer2',
                       salt: '$2a$10$kae7f2x6tfOuIJebD5Lzku',
                       password: '$2a$10$kae7f2x6tfOuIJebD5LzkuALNzK/yrJM//8qBdtw.bZO...' }])

profiles = UserProfile.create([{ user: users[0], surname: "Doe", given_names: "John",
                                 gender: 0, phone: "444-444", mail: "admin@st.com" },
                               { user: users[1], surname: "Doe", given_names: "Nick",
                                 gender: 0, phone: "444-444", mail: "nick@st.com" },
                               { user: users[2], surname: "Lucas", given_names: "Smith",
                                 gender: 0, phone: "444-444", mail: "lucas@st.com" }])

developers = Developer.create([{ user: users[1], busy: 1 }, { user: users[2], busy: 0 }])

stories = Story.create([{ name: 'Task 1', description: 'Test description.', points: 5 },
                        { name: 'Task 2', description: 'Test description.', points: 5, priority: 5 },
                        { name: 'Task in backlog', description: 'Test description.', points: 1, active: false, priority: 1 }])