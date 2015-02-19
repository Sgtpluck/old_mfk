require 'rails_helper'

RSpec.describe Person, :type => :model do
    describe 'validations' do
    let(:person) { Person.new(name: 'Davida') }

    it 'must have a name' do
      person.name = nil
      expect(person).to be_invalid
    end
  end
end
