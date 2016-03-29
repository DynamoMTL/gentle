require 'gentle/documents/request/shipment_order'

module Gentle
  module Request
    VALID_REQUEST_TYPES = %w(ShipmentOrder)

    def self.valid_type?(type)
      VALID_REQUEST_TYPES.include?(type)
    end
  end
end
