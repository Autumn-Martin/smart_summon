require 'csv'
require './app/models/champion'
# require './app/models/role'

class Seed

  OPTIONS = {headers: true, header_converters: :symbol}

  def self.start
    seed_champions
  end

  def self.seed_champions
    CSV.foreach('./db/csv/champions.csv', OPTIONS)  do |champion|
      champion_hash = { name: champion[:champion]&.downcase,
                        damage: champion[:damage]&.downcase,
                        primary_class: champion[:primary]&.downcase,
                        secondary_class: champion[:secondary]&.downcase}

      champion = Champion.create!(champion_hash)
      puts "Created #{champion.name}"
    end
    puts "Created all champions!"
  end

end

Seed.start
