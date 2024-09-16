Rails + Playwright testing

```sh
# Rails と Playwright のコンテナを起動
./dx/start

# Rails のコンテナにログイン
./dx/exec bash

# Traceを無効にしてテストを実行 => OK
bin/rspec ./spec/system/welcome_spec.rb

# Traceを有効化してテストを実行 => Failed
SAVE_TRACE=1 bin/rspec ./spec/system/welcome_spec.rb

# > /usr/local/bundle/gems/playwright-ruby-client-1.47.0/lib/playwright/connection.rb:113:in `block in async_send_message_to_server': undefined method `add_stack_to_tracing_no_reply' for nil (NoMethodError)
# > 
# >           @local_utils.add_stack_to_tracing_no_reply(id, frames)
# >                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
# >         from /usr/local/bundle/gems/playwright-ruby-client-1.47.0/lib/playwright/connection.rb:133:in `with_generated_id'
# >         from /usr/local/bundle/gems/playwright-ruby-client-1.47.0/lib/playwright/connection.rb:80:in `async_send_message_to_server'
# >         from /usr/local/bundle/gems/playwright-ruby-client-1.47.0/lib/playwright/connection.rb:121:in `send_message_to_server'
# >         from /usr/local/bundle/gems/playwright-ruby-client-1.47.0/lib/playwright/channel.rb:35:in `block in send_message_to_server_result'
# >         from /usr/local/bundle/gems/playwright-ruby-client-1.47.0/lib/playwright/channel.rb:67:in `with_logging'
# >         from /usr/local/bundle/gems/playwright-ruby-client-1.47.0/lib/playwright/channel.rb:34:in `send_message_to_server_result'
# >         from /usr/local/bundle/gems/playwright-ruby-client-1.47.0/lib/playwright/channel.rb:20:in `send_message_to_server'
# >         from /usr/local/bundle/gems/playwright-ruby-client-1.47.0/lib/playwright/channel_owners/browser.rb:75:in `close'
# >         from /usr/local/bundle/gems/playwright-ruby-client-1.47.0/lib/playwright_api/browser.rb:37:in `close'
# >         from /usr/local/bundle/gems/capybara-playwright-driver-0.5.2/lib/capybara/playwright/driver.rb:56:in `quit'
# >         from /usr/local/bundle/gems/capybara-playwright-driver-0.5.2/lib/capybara/playwright/driver.rb:48:in `block in create_playwright_browser'
# > /usr/local/bundle/gems/rspec-core-3.13.1/lib/rspec/core/runner.rb:46:in `exit': exit (SystemExit)
# >         from /usr/local/bundle/gems/rspec-core-3.13.1/lib/rspec/core/runner.rb:46:in `invoke'
# >         from /usr/local/bundle/gems/rspec-core-3.13.1/exe/rspec:4:in `<top (required)>'
# >         from bin/rspec:27:in `load'
# >         from bin/rspec:27:in `<main>'
```
