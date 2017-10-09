require 'rails_helper'

feature "Authentications", type: :feature do
  before do
    user = build(:user, password: 'secret')
    user.save
    visit '/users/sign_in'
    fill_in 'Email', with: user.email
    fill_in 'Password', with: 'secret'
    click_button 'Log in'
  end
  it "sign me in" do
    expect(page).to have_content 'Signed in successfully'
  end
  it "sign me out" do
    click_link 'Sign Out'
    expect(page).to have_content 'Signed out successfully.'
  end
end