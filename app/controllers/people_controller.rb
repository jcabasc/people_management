class PeopleController < ApplicationController
  expose(:person, attributes: :person_params, finder_parameter: :id)
  expose(:people) { Person.all.order(first_name: :desc, last_name: :desc) }

  def create
    save_or_render
  end

  def update
    save_or_render
  end

  def destroy
    person.destroy if person.present?
    redirect_to :people
  end

  private

  def save_or_render
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