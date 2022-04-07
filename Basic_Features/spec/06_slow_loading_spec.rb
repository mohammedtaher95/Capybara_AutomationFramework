require 'spec_helper'

feature 'Dynamic Loading: Validate Page Elements' do
  background do
    visit 'dynamic_loading/1'
  end

  scenario 'Displayed Title: Dynamically Loaded Page Elements' do
    expect(page).to have_css('h3', text: 'Dynamically Loaded Page Elements')
  end

  scenario 'Displayed Button: Start' do
    expect(page).to have_button('Start')
  end
end

feature 'Checking Slow Loading Components' do
  background do
    visit 'dynamic_loading/1'
  end

  scenario 'Page Should Wait For Hello World' do
    click_button('Start')
    expect(page).to have_content('Hello World!')
  end
end
