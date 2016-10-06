class PeopleController < ApplicationController
  expose(:person) { params[:id].present? ? Person.find(params[:id]).decorate : Person.new }
  expose(:people) { Person.all.map{ |person| PersonDecorator.new(person) } }

  def create
    save_or_render(action: 'new')
  end

  def update
    save_or_render(action: 'edit')
  end

  def destroy
    person.destroy if person.present?
    redirect_to :people
  end

  private

  def save_or_render(action:)
    person.assign_attributes(person_params)
    if person.save
      flash[:success] = 'The person was saved!'
      redirect_to(person)
    else
      flash[:alert] = 'The person was not saved!'
      render action.to_sym
    end
  end

  def person_params
    params.require(:person).permit(:first_name, :last_name, :email,
                                   :job, :bio, :gender, :birthdate, :picture)
  end
end