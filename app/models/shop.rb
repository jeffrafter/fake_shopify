# https://docs.shopify.com/api/shop

class Shop < ActiveRecord::Base
  API_ATTRIBUTES = [
    :name,
    :email,
    :domain,
    :province,
    :province_code,
    :country,
    :country_code,
    :country_name,
    :address1,
    :zip,
    :city,
    :source,
    :phone,
    :customer_email,
    :latitude,
    :longitude,
    :primary_location_id,
    :primary_locale,
    :currency,
    :timezone,
    :iana_timezone,
    :shop_owner,
    :money_format,
    :money_with_currency_format,
    :taxes_included,
    :tax_shipping,
    :county_taxes,
    :plan_display_name,
    :plan_name,
    :has_discounts,
    :has_gift_cards,
    :myshopify_domain,
    :google_apps_domain,
    :google_apps_login_enabled,
    :money_in_emails_format,
    :eligible_for_payments,
    :requires_extra_payments_agreement,
    :password_enabled,
    :has_storefront,
    :setup_required,
  ]

  def self.import_all(options={})
    ShopifyAPI::Shop.find_all(options) do |shop|
      obj = self.where(id: shop.id).first
      obj ||= self.new(id: shop.id)
      obj.import(shop)
    end
    nil
  end

  def self.import(id)
    shop = ShopifyAPI::Shop.find(id)
    obj = self.where(id: shop.id).first
    obj ||= self.new(id: shop.id)
    result = obj.import(shop)
    obj
  end

  def import(shop)
    API_ATTRIBUTES.each do |attribute|
      self.attributes[attribute] = shop[attribute]
    end
    self.save
  end

end
