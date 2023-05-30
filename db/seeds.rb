10.times do |n|
  email = "user_#{n + 1}@example.com"
  User.create!(
    name: "User #{n + 1} Exemple",
    email: email,
    password: '123456',
    api_key: SecureRandom.hex(16)
  )
end
