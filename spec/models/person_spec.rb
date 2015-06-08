require 'rails_helper'

RSpec.describe Person, :type => :model do
  describe 'validations' do
    let(:person) { Person.new(name: 'Mario Batali') }
    let(:person1) { Person.new(name: 'Bobby Flay') }
    let(:person2) { Person.new(name: 'Guy Fieri') }

    # TODO: figure out the wikipedia response and mock it out
    # before do
      # allow(person).to receive(:verify_person).and_return(wiki_blob)
    # end
    
    it 'must have a name' do
      person.name = nil
      expect(person).to be_invalid
    end

    xit 'must be a famous person' do
      person.name = 'Davida Marion'
      # If the response can't find the person, 
      expect(person).to be_invalid
    end
  end

  describe 'find_three' do

  end
end
