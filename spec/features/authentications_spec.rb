require 'rails_helper'

feature "Authentications", type: :feature do
  before do
    auth_user
  end
  it "sign me in" do
    expect(page).to have_content 'Signed in successfully'
  end
  it "sign me out" do
    click_link 'Sign Out'
    expect(page).to have_content 'Signed out successfully.'
  end
end