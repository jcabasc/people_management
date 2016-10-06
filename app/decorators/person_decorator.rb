class PersonDecorator < Draper::Decorator
  delegate_all
  decorates_finders

  def full_name
    "#{first_name} #{last_name}"
  end

  def age
    now = Date.today
    now.year - birthdate.year - (birthdate.change(year: now.year) > now ? 1 : 0)
  end

  def picture_url
    if picture?
      picture
    else
      ActionController::Base.helpers.image_path("default-#{gender}.png")
    end
  end
end