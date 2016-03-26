class PersonController < ApplicationController

before_action :authenticate_user!, except: [:list]

  def list
    @person = Person.all
  end

  def show
    @person = Person.find(params[:id])
  end


  def new
    @person = Person.new
  end

  def create
    @person = Person.new(person_params)

    if @person.save
      redirect_to :action =>'list'
    end

  end

  def edit
    @person = Person.find(params[:id])
  end

  def update
    @person = Person.find(params[:id])
    if @person.update_attributes(person_params)
      redirect_to :action =>'show'
    end
  end

  def delete
    @person = Person.find(params[:id]).destroy
    redirect_to :action =>'list'
  end

  def person_params
    params.require(:person).permit(:name,:surname)
  end
end
