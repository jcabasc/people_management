class Person < ActiveRecord::Base

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

  private

  def birthdate_cannot_be_in_the_future
    errors.add(:birthdate, "is not a valid date") if Date.today <= birthdate
  end
end
