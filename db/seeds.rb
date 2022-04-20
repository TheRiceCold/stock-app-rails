# allows to .rb files to seed data from the db/seeds folder
Dir[File.join(Rails.root, 'db', 'seeds', '*rb')].sort.each do |seed|
  load seed
end if Rails.env.development?

# AdminUser.create!(
#   email: 'admin@example.com',
#   password: 'password',
#   password_confirmation: 'password'
# ) if Rails.env.development?

user = User.new(
  email: 'gonfreecs@hunters.com',
  password: 'test1234',
  password_confirmation: 'test1234'
)
user.skip_confirmation!
user.save!
