require 'rails_helper'
require 'httparty'

RSpec.describe Wiki do
  describe 'verify_person' do
    let(:not_a_person) { 
      { 
        "query" => {
          "pages" => {
            "-1" => "blah"
          } 
        }
      }
    }


    let(:totally_a_person) {
      {
        "query" => {
          "pages" => {
            "67241" => {

            }
          }
        }
      }

    }

    it 'returns nil if it is not a person with a wiki page' do
      HTTParty.stub(:get) { not_a_person }
      expect(Wiki.verify_person("davida")).to be(nil)
    end
  end
end


    # it 'must have a name' do
    #   person.name = nil
    #   expect(person).to be_invalid
    # end
