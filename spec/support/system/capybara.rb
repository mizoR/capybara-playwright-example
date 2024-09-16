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

Capybara.default_max_wait_time = 5
Capybara.default_driver = :my_playwright
