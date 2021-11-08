# frozen_string_literal: true

RSpec.configure do |config|
  # Specify a root directory where the generated Swagger files will be saved.
  config.swagger_root = "#{Rails.root}/swagger"

  config.swagger_docs = {
    'v1/swagger.json' => {
      openapi: '3.0.1',
      info: {
        title: 'API V1',
        version: 'v1',
        description: 'Sonda API'
      },
      servers: [
        {
          url: 'https://{defaultHost}',
          variables: {
            defaultHost: {
              default: 'www.example.com'
            }
          }
        }
      ]
    }
  }
end
