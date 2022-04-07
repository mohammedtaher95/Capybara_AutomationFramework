require 'spec_helper'

feature 'Login Page: Validate Page Elements' do
  background do
    visit '/login'
  end

  scenario 'Displayed Title: Login Page' do
    expect(page).to have_css('h2', text: 'Login Page')
  end

  scenario 'Displayed Textbox: Username' do
    expect(page).to have_field('Username')
  end

  scenario 'Displayed Textbox: Password' do
    expect(page).to have_field('Password')
  end

  scenario 'Displayed Button: Login' do
    expect(page).to have_button('Login')
  end
end

feature 'Login Page: Invalid Credentials Display Alert to User' do
  background do
    visit '/login'
  end

  scenario 'MohamedTaher / wrong_password: Your username is invalid!' do
    error_message = 'Your username is invalid!'
    fill_in('Username', with: 'MohamedTaher')
    fill_in('Password', with: 'wrong_password')
    click_button('Login')
    expect(page).to have_css('div.flash', text: error_message)
  end

  scenario 'tomsmith / wrong_password: Your password is invalid!' do
    error_message = 'Your password is invalid!'
    fill_in('Username', with: 'tomsmith')
    fill_in('Password', with: 'wrong_password')
    click_button('Login')
    expect(page).to have_css('div.flash', text: error_message)
  end
end

feature 'Login Page: Valid Credentials Login to Secure Area' do
  background do
    visit '/login'
  end

  scenario 'tomsmith / SuperSecretPassword!' do
    message = 'You logged into a secure area!'
    fill_in('Username', with: 'tomsmith')
    fill_in('Password', with: 'SuperSecretPassword!')
    click_button('Login')
    expect(page).to have_css('h2', text: 'Secure Area')
    expect(page).to have_css('div.flash', text: message)
  end
end
