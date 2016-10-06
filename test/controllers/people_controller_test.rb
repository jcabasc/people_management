require 'test_helper'

class PeopleControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get people_path
    must_respond_with :success
    assert_not_nil assigns["_resources"][:people]
    must_render_template 'people/index'
  end

  test "should get new" do
    get new_person_path
    assert_response :success
    assert_not_nil assigns["_resources"][:person]
    must_render_template 'people/new'
  end

  test "should get person profile" do
    person = FactoryGirl.create(:person)
    get "/people/#{person.id}"
    assert_response :success
    assert_not_nil assigns["_resources"][:person]
    must_render_template 'people/show'
  end

  test "should get edit person" do
    person = FactoryGirl.create(:person)
    get "/people/#{person.id}/edit"
    assert_response :success
    assert_not_nil assigns["_resources"][:person]
    must_render_template 'people/edit'
  end

  test "should create a new user" do
    person_params = FactoryGirl.attributes_for(:person)
    assert_difference('Person.count') do
      post people_url,  person: person_params
    end
    assert_redirected_to person_path(controller.person)
    assert_equal "The person was saved!", flash[:success]
  end

  test "should update an existing person" do
    person = FactoryGirl.create(:person)
    person_params = { email: 'test@sample.co', bio: 'simple' }
    put "/people/#{person.id}",  person: person_params
    assert_redirected_to person_path(person)
    assert_equal "The person was saved!", flash[:success]
    person.reload
    assert_equal person.email, 'test@sample.co'
    assert_equal person.bio, 'simple'
  end

  test "should delete an existing person" do
    person = FactoryGirl.create(:person)
    assert_difference('Person.count', -1) do
      delete "/people/#{person.id}"
    end
    assert_redirected_to people_path
  end
end
