require 'rails_helper'

feature 'anguler test ' do
  let(:email) { "bob@example.com "}
  let(:password) { "password123"}

  before do
    User.create!(email: email, password: password, password_confirmation: password)
  end
  scenario 'Our Angular test app is working' do
    visit "/angular_test"

    fill_in 'Email', with: 'bob@example.com'
    fill_in 'Password', with: 'password123'
    click_button 'Log in'

    expect(page).to have_content("Name")

    fill_in 'name', with: 'Bob'
    within 'header h1' do
      expect(page). to have_content('Bob')
    end
  end
end
