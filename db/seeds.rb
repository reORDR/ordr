# - - - Users - - -

scott = User.new(
  email: 'scott@example.com',
  password: 'password',
  password_confirmation: 'password'
)

mary = User.new(
  email: 'mary@example.com',
  password: 'password',
  password_confirmation: 'password'
)

garrett = User.new(
  email: 'garrett@example.com',
  password: 'password',
  password_confirmation: 'password'
)

users = [scott, mary, garrett]

users.each { |user| user.save }

# - - - Jobs - - -

job_a = {
  title: 'Rails Instructor',
  company_name: 'Code Fellows',
  url: 'www.example.com',
  due_date: DateTime.now
}

job_b = {
  title: 'Junior Developer',
  company_name: 'Citizen Code',
  url: 'www.example.com',
  due_date: DateTime.now
}

job_1 = scott.jobs.new(job_a)
job_2 = scott.jobs.new(job_b)
job_3 = mary.jobs.new(job_a)
job_4 = mary.jobs.new(job_b)
job_5 = garrett.jobs.new(job_a)
job_6 = garrett.jobs.new(job_b)

jobs = [job_1, job_2, job_3, job_4, job_5, job_6]

jobs.each { |job| job.save }

# - - - Documents - - -

doc = {
  resume: true,
  cover_letter: true,
  portfolio: true,
  certifications: false,
  references: false,
  recommendations: true,
  done: false
}

jobs.each do |job|
  job.create_document(doc)
end
