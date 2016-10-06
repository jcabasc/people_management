require 'test_helper'

class PersonDecoratorTest < ActiveSupport::TestCase
  def setup
    person = FactoryGirl.create(:person)
    @decorated_person = person.decorate
  end

  def test_decorated_attributes
    assert_equal @decorated_person.full_name, "John Doe"
    assert_equal @decorated_person.age, 30
    assert_equal @decorated_person.picture_url, "/assets/default-male-c1b745a6206eced20f5781267535865b700483f415fa2c626e3e16ac4e918116.png"
  end
end