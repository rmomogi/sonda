# frozen_string_literal: true

module JsonHelpers
  def json_response
    JSON(response.body, symbolize_names: true)
  end
end
