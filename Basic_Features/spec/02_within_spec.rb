require 'spec_helper'

feature 'Within: Scoping' do
  background do
    visit '/checkboxes'
  end

  scenario 'Current URL: https://the-internet.herokuapp.com/checkboxes' do
    expect(page).to have_current_path('https://the-internet.herokuapp.com/checkboxes')
  end

  scenario 'Within (Checkboxes): checkbox 1' do
    within('form#checkboxes') do
      expect(page).to have_content('checkbox 1')
    end
  end

  scenario 'Within (Checkboxes): checkbox 2' do
    within('form#checkboxes') do
      expect(page).to have_content('checkbox 2')
    end
  end

  scenario 'Checking checkbox 2 is checked' do
    within('form#checkboxes') do
      find(:xpath, '//*[@id="checkboxes"]/input[2]').checked?
    end
  end

  scenario 'Checking checkbox 1 is unchecked' do
    within('form#checkboxes') do
#  expect(page.find(:xpath, '//*[@id="checkboxes"]/input[1]')).
    end
  end

  scenario 'Check checkbox 1' do
    within('form#checkboxes') do
      find(:xpath, xpath: checkbox_1).set(true)
      find(:xpath, '//*[@id="checkboxes"]/input[1]').checked?
    end
  end

  scenario 'Uncheck checkbox 2' do
    within('form#checkboxes') do
      find(:xpath, '//*[@id="checkboxes"]/input[2]').set(false)
#      find(:xpath, '//*[@id="checkboxes"]/input[2]').
    end
  end

end

checkbox_1 = '//*[@id="checkboxes"]/input[1]'
checkbox_2 = '//*[@id="checkboxes"]/input[2]'
