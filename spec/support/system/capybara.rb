require 'capybara-playwright-driver'

# setup
Capybara.register_driver(:my_playwright) do |app|
  # Capybara::Playwright::Driver.new(app, browser_type: :chromium, headless: false)
  Capybara::Playwright::Driver.new(
    app,
    browser_type: :chromium,
    playwright_browser: :chromium,
    playwright_server_endpoint_url: "ws://playwright:4445/",
    save_path: Rails.root.join("tmp/screenshots"),
    viewport: { width: 1080, height: 640 },
    fullscreen: true,
  )
end

Capybara.default_driver = :my_playwright

RSpec.configure do |config|
  if ENV['SAVE_TRACE'] == '1'
    config.before(:each, type: :system) do |example|
      Capybara.current_session.driver.on_save_trace do |trace_zip_path|
        puts "[ spec/support/system/capybara.rb ] trace_zip_path - #{trace_zip_path}: #{File.exist?(trace_zip_path)}"
      end
    end
  end
end
