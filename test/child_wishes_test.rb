# frozen_string_literal: true

require "minitest/autorun"
require "mail_santa_ruby"
require_relative "test_helper"

class ChildWishesTest < Minitest::Test
  def test_retrieve_child_wishes
    VCR.use_cassette("fetch_child_wishes") do
      child_wishes = MailSanta::ChildWishes.all
      assert_instance_of Array, child_wishes
      assert child_wishes.first.key?("child_id")
    end
  end
end
