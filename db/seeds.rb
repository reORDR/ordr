# - - - Users - - -

scott = User.new(
  email: 'scott@example.com',
  password: 'password',
  password_confirmation: 'password'
)
scott.save
mary = User.new(
  email: 'mary@example.com',
  password: 'password',
  password_confirmation: 'password'
)
mary.save
garrett = User.new(
  email: 'garrett@example.com',
  password: 'password',
  password_confirmation: 'password'
)
garrett.save

# - - - Jobs - - -

[scott, mary, garrett].each do |user|
  user.jobs.create(
    title: 'Rails Instructor',
    company_name: 'Code Fellows',
    url: 'www.example.com',
    due_date: DateTime.now
  )
  user.jobs.create(
    title: 'Junior Developer',
    company_name: 'Citizen Code',
    url: 'www.example.com',
    due_date: DateTime.now
  )
end
