namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do
    admin = Account.create!(email: "example@kaljaa.org",
                 password: "foobar",
                 password_confirmation: "foobar",
				authorization: "1",
				ty: "brewery")
	admin.toggle!(:admin)
    99.times do |n|
      name  = Faker::Name.name
      email = "example-#{n+1}@kaljaa.org"
      password  = "password"
      Account.create!(
                   email: email,
                   password: password,
                   password_confirmation: password,
				authorization: "1",
				ty: "brewery")
    end
	accounts = Account.all(limit: 6)
		50.times do
		content = Faker::Lorem.sentence(5)
		accounts.each { |account| account.microposts.create!(content: content) }
	end
  end
end