# frozen_string_literal: true

require 'faker'
require 'bcrypt'

10.times do
  attrs = {
    email: Faker::Internet.email,
    name: Faker::Name.name,
    password_digest: BCrypt::Password.create('password')
  }
  user = User.new(attrs)
  user.save!
end

path = Rails.root.join('test/fixtures/files/data.json')
file = File.new(path, 'r:UTF-8')

JSON.parse(file.read).each do |data|
  program = Program.new(data)
  program.save!
end
