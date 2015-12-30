class Order < ActiveRecord::Base
  # send_webhooks - Determines whether existing webhooks will be fired for this order
  # send_receipt - Determines whether an order confirmation will be sent to the customer. Default: false.
  # send_fulfillment_receipt - Determines whether a fulfillment confirmation will be sent to the customer. Default: false.
  # inventory_behaviour - Determines which inventory updating behaviour is used. The following values are available:
  #   bypass (default): Do not claim inventory.
  #   decrement_ignoring_policy: Ignore the product's inventory policy and claim amounts no matter what.
  #   decrement_obeying_policy: Obey the product's inventory policy.

end
