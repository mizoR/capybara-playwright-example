require 'rails_helper'

RSpec.describe 'Welcome', type: :system do
  it do
    Capybara.app_host = "http://web:3200/"

    Capybara.use_default_driver

    expect(Capybara.current_driver).to eq(:my_playwright)

    visit("/")

    expect(page).to have_content('Ruby version: ruby 3.3.5')
  end
end
