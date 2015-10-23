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

# - - - Contacts - - -

paul_allen = {
  name: 'Paul Allen',
  email: 'hendrixfiend@vulcan.net',
  company: 'Vulcan',
  phone: '206-123-4567',
  linkedin_url: 'www.linkedin.com/paulywog',
}

matz = {
  name: 'Yukihiro Matsumoto',
  email: 'matz@ruby.lang',
  company: 'Heroku',
  phone: '777-777-7777',
  linkedin_url: 'www.linkedin.com/matz'
}

jobs.each do |job|
  job.contacts.create!(paul_allen)
  job.contacts.create!(matz)
end

# - - - Research - - -

research = {
  company_mission: 'Do good and change the world',
  company_goals: 'Make a lot of money and then give it all away',
  current_projects: 'Killer appz',
  done: true
}
jobs.each { |job| job.create_research!(research) }


# - - - Interviews - - -

interview = {
  format: 'Phone',
  thank_you: false,
  date: 10.days.from_now
}
jobs.each { |job| job.create_interview!(interview) }

# - - - Networks - - -

network = {
  plans: true,
  date: 10.days.from_now,
  done: false
}
jobs.each { |job| job.create_network!(network) }

# - - - Job Applications - - -

jobs.each { |job| job.create_job_application! }

# - - - Notes - - -

steps = Job::STEPS.keys

jobs.each do |job|
  steps.each do |step|
    instance = step.classify.constantize.find(job.id)
    instance.notes.create!(body: "#{step} note!!!")
  end
end
