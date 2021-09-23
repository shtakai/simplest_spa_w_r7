# frozen_string_literal: true

# Be sure to restart your server when you modify this file.

# Avoid CORS issues when API is called from the frontend app.
# Handle Cross-Origin Resource Sharing (CORS) in order to accept cross-origin AJAX requests.

# Read more: https://github.com/cyu/rack-cors

# Rails.application.config.middleware.insert_before 0, Rack::Cors do
#   allow do
#     origins 'example.com'
#
#     resource '*',
#       headers: :any,
#       methods: [:get, :post, :put, :patch, :delete, :options, :head]
#   end
# end
#

Rails.application.config.middleware.insert_before(
  0,
  Rack::Cors,
  debug: Rails.env.development?,
  logger: (-> { Rails.logger }),
) do
  allow do
    origins do |source, _env|
      Rails.logger.debug "==== source #{source}"
      source # echo back the client's `Origin` header instead of using `*`
    end

    resource '*',
             headers: :any,
             methods: %i[get post put patch delete options head],
             credentials: true
  end
end
# rubocop: enable Rubycw/Rubycw
