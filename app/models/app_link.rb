class AppLink < ActiveRecord::Base
  LOCATIONS = [
    :orders_overview,
    :orders_action_drop_down,
    :order_details,
    :products_overview,
    :products_action_drop_down,
    :product_details,
    :variants_action_drop_down,
    :variant_details,
    :custom_collections_overview,
    :custom_collection_details,
    :smart_collection_details,
    :pages_overview,
    :page_details,
    :blog_details,
    :article_details,
    :checkout_details,
  ]
end
