# frozen_string_literal: true

require 'spree/core'
require 'solidus_payment_method_by_zone'

module SolidusPaymentMethodByZone
  class Engine < Rails::Engine
    include SolidusSupport::EngineExtensions

    isolate_namespace SolidusPaymentMethodByZone

    engine_name 'solidus_payment_method_by_zone'

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), '../../app/**/*_decorator*.rb')) do |c|
        Rails.configuration.cache_classes ? require(c) : load(c)
      end
    end

    config.to_prepare(&method(:activate).to_proc)
  end
end
