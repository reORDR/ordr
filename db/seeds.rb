# - - - Users - - -

scott = User.create!(
  email: 'scott@example.com',
  password: 'password',
  password_confirmation: 'password'
)

mary = User.create!(
  email: 'mary@example.com',
  password: 'password',
  password_confirmation: 'password'
)

garrett = User.create!(
  email: 'garrett@example.com',
  password: 'password',
  password_confirmation: 'password'
)


# - - - Jobs - - -
# job must have a document

job_a = {
  title: 'Rails Instructor',
  company_name: 'Code Fellows',
  url: 'www.example.com',
  due_date: DateTime.now,
  source: 'Job Posting'
}

job_b = {
  title: 'Junior Developer',
  company_name: 'Citizen Code',
  url: 'www.example.com',
  due_date: DateTime.now,
  source: 'Nepotism'
}

document = {
  resume: true,
  cover_letter: true,
  portfolio: false,
  certifications: false,
  references: true,
  recommendations: false,
  done: false
}

def create_job(job, user, document)
  Job.create!(job.merge(user: user, document: Document.create!(document)))
end

scott_job_a = create_job(job_a, scott, document)
scott_job_b = create_job(job_b, scott, document)
mary_job_a = create_job(job_a, mary, document)
mary_job_b = create_job(job_b, mary, document)
garrett_job_a = create_job(job_a, garrett, document)
garrett_job_b = create_job(job_b, garrett, document)

jobs = [
  scott_job_a, scott_job_b,
  mary_job_a, mary_job_b,
  garrett_job_a, garrett_job_b
]
jobs.each do |job|
  job.create_document(doc)
end
