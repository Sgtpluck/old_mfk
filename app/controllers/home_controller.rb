class HomeController < ApplicationController
  def index
    @choices = Person.findThree
    @person = Person.new
  end

  def vote
    @updated_persons = Person.updateMFKs(params)
    render json: @updated_persons
  end

  def add_person
    person = Wiki.new(params[:name]).verify_person()
    
    if Person.save_person(person)
      render json: { person: person.name }
    else 
      render json: { person: nil }
    end
  end
end
