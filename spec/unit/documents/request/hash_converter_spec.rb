require 'spec_helper'
require 'gentle/documents/request/shipment_order'
require 'gentle/documents/request/hash_converter'

module Gentle
  module Documents
    module Request
      describe "ShipmentOrder" do
        include Gentle::Documents::Request::HashConverter

        it "serializes the line item parts into a hash" do
          part = PartLineItemDouble.example(
            variant: VariantDouble.example(id: 1214, sku: "SKU42", price: 25.95),
            line_item: LineItemDouble.example(quantity: 3)
          )

          hash = part_line_item_hash(part)

          assert_equal "SKU42", hash['ItemNumber']
          assert_instance_of Fixnum, hash['Line']
          assert_equal 3, hash['QuantityOrdered']
          assert_equal 3, hash['QuantityToShip']
          assert_equal "EA", hash['UOM']
          assert_equal 25.95, hash['Price']
        end

        it "serializes the line item into a hash" do
          item = LineItemDouble.example

          hash = line_item_hash(item)

          assert_equal item.sku, hash['ItemNumber']
          assert_instance_of Fixnum, hash['Line']
          assert_equal item.quantity, hash['QuantityOrdered']
          assert_equal item.quantity, hash['QuantityToShip']
          assert_equal "EA", hash['UOM']
          assert_equal item.price, hash['Price']
        end
      end
    end
  end
end
