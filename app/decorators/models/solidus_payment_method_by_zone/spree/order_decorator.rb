# frozen_string_literal: true

module SolidusPaymentMethodByZone
  module Spree
    module OrderDecorator
      def self.prepended(base)
        base.class_eval do
          def available_payment_methods
            @available_payment_methods ||=
              ::Spree::PaymentMethod.available_to_address(ship_address)
          end
        end
      end

      ::Spree::Order.prepend(self)
    end
  end
end
