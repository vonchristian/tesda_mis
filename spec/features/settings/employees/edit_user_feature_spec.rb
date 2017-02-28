require 'rails_helper'

feature "Edit Employee" do 
  before(:each) do 
    user = FactoryGirl.create(:user)
    login_as(user, :scope => :user)

    employee = create(:user)
    
    visit settings_employees_path 
    click_link employee.email
    click_link "Update Info"
  end

  scenario 'with valid attributes' do 
    fill_in "First name", with: "Test Name"
    fill_in "Middle name", with: "Middle Name"
    fill_in "Last name", with: "LAst"
    choose "TESDA SPECIALIST II"
    attach_file("Upload Photo", Rails.root + "spec/support/avatars/default_avatar.png")
    fill_in "Email", with: "test@email.com"
    fill_in "Password", with: "secretpassword"
    fill_in "Password confirmation", with: "secretpassword"
    click_button "Update Employee"

    expect(page).to have_content "updated successfully"
  end 

  scenario "with invalid attributes" do 
    click_button "Update Employee"

    expect(page).to have_content "can't be blank"
  end
end 
