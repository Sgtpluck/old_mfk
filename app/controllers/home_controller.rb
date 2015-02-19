class HomeController < ApplicationController
  def index
    @choices = Person.findThree
  end

  def vote
    @updated_persons = Person.updateMFKs(params)
    render json: @updated_persons
  end
end
