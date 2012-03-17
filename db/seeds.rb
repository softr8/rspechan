# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

puts 'Checking for initial organization....'
organization = Organization.find_or_create_by_name(name: "Crowd Interactive")
puts '...done!'

puts 'Checking for initial ruby'
ruby = Ruby.find_or_create_by_name(name: 'ruby-1.9.3-rc1', status: 'active')
puts '...done!'

puts 'Checking for initial projects'
Project.find_or_create_by_repo(repo: 'git@github.com:crowdint/fulcrum.git', ruby_id: ruby.id, name: 'fulcrum', organization_id: organization.id)
Project.find_or_create_by_repo(repo: 'git@github.com:crowdint/crowdblog-app.git', ruby_id: ruby.id, name: 'blog', organization_id: organization.id)
puts '...done!'