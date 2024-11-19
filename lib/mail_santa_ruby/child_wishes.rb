# frozen_string_literal: true

require "mail_santa_ruby/client"

module MailSanta
  class ChildWishes # rubocop:disable Style/Documentation
    def self.client
      @client ||= MailSanta::Client.new
    end

    def self.all
      client.get("/child_wishes")
    end
  end
end
