# This wrapper class simplifies normal Shopify metafields
# interaction by removing the requirement to fetch the
# parent resource (saving 1 API call where possible).
class Metafields
  def initialize(options={})
    @prefix_options = options
  end

  def clear(options={})
    set(options.merge(value: nil))
  end

  def set(options={})
    metafield = ShopifyAPI::Metafield.new({
      description: options[:description],
      namespace: options[:namespace],
      key: options[:key].to_s,
      value: options[:value].to_s,
      value_type: 'string'
    })
    metafield.prefix_options = @prefix_options
    metafield.save
  end

  def remove(options={})
    metafield = ShopifyAPI::Metafield.where({
      resource: @prefix_options[:resource],
      resource_id:  @prefix_options[:resource_id],
      namespace: options[:namespace],
      key: options[:key].to_s
    }).first
    metafield.destroy if metafield
  end

  def all
    @all ||= ShopifyAPI::Metafield.where(
      resource: @prefix_options[:resource],
      resource_id:  @prefix_options[:resource_id],
    )
  end

  def metafield(key, options={})
    all.detect do |metafield|
      next if options[:namespace] && options[:namespace] != metafield.namespace
      metafield.key == key
    end
  end
end
