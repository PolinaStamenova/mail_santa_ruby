# frozen_string_literal: true

require "minitest/autorun"
require "mail_santa_ruby"
require_relative "test_helper"

class ClientTest < Minitest::Test
  def test_client_get_wrong_path
    VCR.use_cassette("client_get_wrong_path") do
      path = "/fake_path"
      client = MailSanta::Client.new

      assert_raises(RuntimeError, "API request failed with status: 404") do
        client.get(path)
      end
    end
  end

  def test_client_get_correct_path
    VCR.use_cassette("client_get_correct_path") do
      path = "/child_wishes"
      client = MailSanta::Client.new
      response = client.get(path)

      response.is_a?(Net::HTTPSuccess)
    end
  end
end
