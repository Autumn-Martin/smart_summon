require 'csv'
require './app/models/champion'



class Seed

  OPTIONS = {headers: true, header_converters: :symbol}
  ROLES = ["top", "jungle", "mid", "adc", "support"]

  def self.start
    clear_existing_data
    seed_champions
    seed_roles
    add_roles_to_champions
  end

  def self.clear_existing_data
    Champion.destroy_all
    Role.destroy_all
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

  def self.seed_roles
    ROLES.each do |title|
      role = Role.create!(title: title)
      puts "#{role.title} created!"
    end
  end

  def self.add_roles_to_champions
    CSV.foreach('./db/csv/champions.csv', OPTIONS)  do |row|
      champion = Champion.find_by(name: row[:champion].downcase)
      ROLES.each do |role|
        if row[role.to_sym] != nil
          champion.roles << Role.find_by(title: role)
        end
      end
    end
    puts "Added roles to all champions!"
  end

end

Seed.start
