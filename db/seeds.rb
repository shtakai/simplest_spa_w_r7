10.times do |n|
  User.create(
    name: "u#{n}",
    password: 'pass',
    password_confirmation: 'pass'
  )
end

30.times do |n|
  Post.create(
    body: "post---#{n}====",
    user_id: User.pluck(:id).sample
  )
end
