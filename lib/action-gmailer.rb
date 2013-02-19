require "action_mailer"
require "active_support"

module ActionGmailer

  class DeliveryError < StandardError
  end

  class DeliveryMethod

    attr_accessor :settings

    def initialize(settings)
      self.settings = settings
    end

    def smtp_server
      self.settings[:smtp_server]
    end

    def smtp_port
      self.settings[:smtp_port]
    end

    def ouath2_token
      self.settings[:token]
    end

    def email
      self.settings[:email]
    end

    def host
      self.settings[:smtp_host]
    end

    def deliver!(mail)
      #FIXME: send
    rescue
      raise DeliveryError, "FIXME"
    end
  end
end

ActionMailer::Base.add_delivery_method :action_gmailer, ActionGmailer::DeliveryMethod
