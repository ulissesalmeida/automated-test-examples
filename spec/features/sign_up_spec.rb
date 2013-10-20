require 'spec_helper'

feature 'Sign up' do
  scenario 'signing up with correct data' do
    visit root_path
    click_link 'Sign up'

    within('form') do
      fill_in 'Name', with: 'Jow'
      fill_in 'Email', with: 'jow@mail.com'
      fill_in 'Password', with: 'strong_password'
      fill_in 'Confirm password', with: 'strong_password'

      click_button('Sign up!')
    end

    expect(page).to(
      have_css('.user-name', text: 'Jow')
    )
    expect(page).to(
      have_css('.user-email', text: 'jow@mail.com')
    )
    expect(page).to(
      have_content('You have successfully created the following account')
    )
  end

  scenario 'signing up with registered email' do
    User.create!(email: 'a@b.c')

    visit root_path
    click_link 'Sign up'

    within('form') do
      fill_in 'Name', with: 'Jow'
      fill_in 'Email', with: 'a@b.c'
      fill_in 'Password', with: 'strong_password'
      fill_in 'Confirm password', with: 'strong_password'

      click_button('Sign up!')
    end

    expect(page).to have_content 'Sign up form'
    expect(page).to have_content 'Email has already been taken'
  end
end
