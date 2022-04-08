Dir[File.join(Rails.root, 'db', 'seeds', '*rb')].sort.each do |seed|
  load seed
end if Rails.env.development?

# AdminUser.create!(
#   email: 'admin@example.com',
#   password: 'password',
#   password_confirmation: 'password'
# ) if Rails.env.development?
