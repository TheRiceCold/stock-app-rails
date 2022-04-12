# allows to .rb files to seed data from the db/seeds folder
Dir[File.join(Rails.root, 'db', 'seeds', '*rb')].sort.each do |seed|
  load seed
end if Rails.env.development?
