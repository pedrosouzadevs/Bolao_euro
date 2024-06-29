# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Team.destroy_all
Round.destroy_all
Match.destroy_all
User.destroy_all
puts "Destroing all data"

puts "Creating new Teams and Rounds"
team = ["Espanha", "Geórgia", "Alemanha", "Dinamarca", "Portugal", "Eslovênia", "França", "Bélgica", "Romênia", "Holanda", "Áustria", "Turquia", "Inglaterra", "Eslováquia", "Suíça", "Itália"]
round = ["Best of 16", "Best of 8", "SemiFinal", "Final"]

team.each do |team_name|
  Team.create(name: team_name)
end

round.each do |round_name|
  Round.create(stage: round_name)
end

puts "Creating new Matches"
Match.create!(team_a: Team.find(1), team_b: Team.find(2), round: Round.find(1))
Match.create!(team_a: Team.find(3), team_b: Team.find(4), round: Round.find(1))
Match.create!(team_a: Team.find(5), team_b: Team.find(6), round: Round.find(1))
Match.create!(team_a: Team.find(7), team_b: Team.find(8), round: Round.find(1))
Match.create!(team_a: Team.find(9), team_b: Team.find(10), round: Round.find(1))
Match.create!(team_a: Team.find(11), team_b: Team.find(12), round: Round.find(1))
Match.create!(team_a: Team.find(13), team_b: Team.find(14), round: Round.find(1))
Match.create!(team_a: Team.find(15), team_b: Team.find(16), round: Round.find(1))

puts "Creating new User"


User.create!(email: "phmartinsdesouza@gmail.com", password: "123456", username: "Pedro Souza", admin: true)
