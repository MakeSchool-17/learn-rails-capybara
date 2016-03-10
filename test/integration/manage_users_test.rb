require 'test_helper'

class ManageUsersTest < ActionDispatch::IntegrationTest
  setup do
    # Capybara.current_driver = :webkit
    Capybara.current_driver = :selenium
  end

  test 'create a user' do
    visit('/users')
    sleep 1
    click_link("New User")
    sleep 1
    fill_in("Name", :with => "John")
    sleep 1
    fill_in("Email", :with => "bob@example.com")
    sleep 1
    click_button("Create User")
    sleep 1
    assert page.has_content? "User was successfully created."
    sleep 1
    visit("/users")
    sleep 1
    assert page.has_content? "bob@example.com"
  end

  test 'delete a user' do

  end
end
