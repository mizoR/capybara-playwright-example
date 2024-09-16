require 'rails_helper'

RSpec.describe 'Welcome', type: :system do
  it do
    Capybara.use_default_driver

    expect(Capybara.current_driver).to eq(:my_playwright)

    visit("https://example.com:443/")

    expect(page).to have_content('Example Domain')
  end
end
