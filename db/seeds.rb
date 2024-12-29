# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb
require 'faker'

# Clear existing data
puts "Clearing existing data..."
Journal.destroy_all
EngagementPlan.destroy_all
Patient.destroy_all
Provider.destroy_all

# Create 20 Patients
puts "Creating patients..."
patients = 20.times.map do
  Patient.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email
  )
end

# Create 5 Providers
puts "Creating providers..."
providers = 5.times.map do
  Provider.create!(
    name: Faker::Name.name,
    email: Faker::Internet.unique.email
  )
end

# Create 20 Engagement Plans (many-to-many between patients and providers)
puts "Creating engagement plans..."
20.times do
  EngagementPlan.create!(
    patient: patients.sample,
    provider: providers.sample,
    plan_type: [ 'basic', 'premium' ].sample
  )
end

# Create 50 Journals (multiple entries per patient)
puts "Creating journals..."
50.times do
  Journal.create!(
    text: Faker::Lorem.paragraph(sentence_count: 3),
    patient: patients.sample,  # This will randomly assign journals to patients
    created_at: Faker::Time.between(from: 6.months.ago, to: Time.current)
  )
end

# Ensure each patient has at least one journal entry
puts "Ensuring each patient has at least one journal..."
patients.each do |patient|
  unless patient.journals.exists?
    Journal.create!(
      text: Faker::Lorem.paragraph(sentence_count: 3),
      patient: patient,
      created_at: Faker::Time.between(from: 6.months.ago, to: Time.current)
    )
  end
end

# Print summary
puts "\nSeeding completed!"
puts "Created:"
puts "- #{Patient.count} patients"
puts "- #{Provider.count} providers"
puts "- #{EngagementPlan.count} engagement plans"
puts "- #{Journal.count} journals"

# Print sample distribution of journals per patient
puts "\nSample of journals per patient:"
Patient.limit(5).each do |patient|
  puts "Patient '#{patient.name}' has #{patient.journals.count} journals"
end
