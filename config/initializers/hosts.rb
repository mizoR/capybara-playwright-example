Rails.application.configure do
  config.hosts << 'web:3200' if Rails.env.local?
end
