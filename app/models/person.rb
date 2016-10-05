class Person < ActiveRecord::Base
  include EventRecorder

  GENDER = %w(male female).freeze

  validates :first_name, length: { maximum: 75 }
  validates :first_name, presence: true

  validates :last_name, length: { maximum: 75 }
  validates :last_name, presence: true

  validates :email, length: { maximum: 254 }
  validates :email, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A([\w+\-].?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/i }

  validates :job, length: { maximum: 75 }, allow_nil: true

  validates :bio, length: { maximum: 300 }, allow_nil: true

  validates :gender, presence: true
  validates :gender, inclusion: GENDER

  validates :birthdate, presence: true
  validate :birthdate_cannot_be_in_the_future, :if => :birthdate?

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

  private

  def birthdate_cannot_be_in_the_future
    errors.add(:birthdate, "is not a valid date") if Date.today <= birthdate
  end
end
