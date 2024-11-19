# frozen_string_literal: true

require "net/http"
require "uri"
require "json"

module MailSanta
  class Client # rubocop:disable Style/Documentation
    BASE_URL = "https://mailsanta-2a6e63705071.herokuapp.com/api/v1"

    def initialize
      # TODO: apply when API key logic in the mail-santa app is ready
      # @api_key = Rails.application.credentials.mail_santa[:api_key] || ENV["API_KEY"]
    end

    def get(path)
      uri = URI.parse("#{BASE_URL}#{path}")
      request = Net::HTTP::Get.new(uri)
      # request["Authorization"] = "Bearer #{@api_key}"

      make_request(uri, request)
    end

    private

    def make_request(uri, request)
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == "https"

      response = http.request(request)

      handle_response(response)
    end

    def handle_response(response)
      raise "API request failed with status: #{response.code}" unless response.is_a?(Net::HTTPSuccess)

      JSON.parse(response.body)
    end
  end
end
