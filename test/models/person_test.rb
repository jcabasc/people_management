require 'test_helper'

class PersonTest < ActiveSupport::TestCase

  should validate_length_of(:first_name).is_at_most(75)
  should validate_presence_of(:first_name)

  should validate_length_of(:last_name).is_at_most(75)
  should validate_presence_of(:last_name)

  should validate_length_of(:email).is_at_most(254)
  should validate_presence_of(:email)
  should validate_uniqueness_of(:email)
  should allow_value('test@gap.com').for(:email)
  should_not allow_value("test").for(:email)

  should validate_length_of(:job).is_at_most(75)
  should allow_value(nil).for(:job)

  should validate_length_of(:bio).is_at_most(300)
  should allow_value(nil).for(:bio)

  should validate_presence_of(:gender)
  should validate_inclusion_of(:gender).in_array(Person::GENDER)

  should validate_presence_of(:birthdate)
  should allow_value((Date.today - 29.years)).for(:birthdate)

  def test_validation_on_birthdate
    person = Person.new(birthdate: Date.today + 1.day)
    person.valid?
    assert_equal "is not a valid date", person.errors[:birthdate][0]
  end

  def test_call_method_is_being_called_when_person_is_created
    person = FactoryGirl.build(:person)
    person.expects(:call).with(:create).returns(true)
    assert person.save
  end

  def test_call_method_is_being_called_when_person_is_destroyed
    person = FactoryGirl.create(:person)
    person.expects(:call).with(:destroy).returns(true)
    assert person.destroy
  end
end
