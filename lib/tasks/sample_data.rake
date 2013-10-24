namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
     admin = User.create!(name: "Example User",
                         email: "example@railstutorial.org",
                         password: "1",
                         password_confirmation: "1",
                         admin: true)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "1"
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end