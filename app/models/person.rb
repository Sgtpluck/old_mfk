class Person < ActiveRecord::Base
  validates :name, presence: true
  validates :name, uniqueness: { case_sensitive: false }

  def self.findThree
    scenario = []
    id_range = Person.find_range
    total = 0
    while total < 3
      random_id = Person.minimum("id") + rand(id_range).to_i
      person = Person.find(random_id)
      if person && !scenario.include?(person)
        scenario.push(Person.find(random_id))
        total += 1
      end
    end
    return scenario
  end

  def self.find_range
    max_id = Person.maximum("id")
    min_id = Person.minimum("id")
    return max_id - min_id + 1
  end

  def self.updateMFKs(params)
    updated_persons = []
    params['decisions'].each do  |key, value|
      person = Person.find_by_name(value.downcase)
      person.update("#{key}".to_sym => person[key]+1)
      total = person.marry + person.fuck + person.kill
      updated_persons.push({name: person.name, percentage: (person[key].to_f/total.to_f)})
    end
    return updated_persons
  end

end
