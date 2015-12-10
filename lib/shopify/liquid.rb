module Shopify
  module Liquid
  end
end

Liquid::Template.file_system = Shopify::AssetFileSystem.new
Liquid::Template.register_filter(Shopify::Filters::StylesheetTagFilter)
Liquid::Template.register_filter(Shopify::Filters::ScriptTagFilter)
Liquid::Template.register_filter(Shopify::Filters::AssetUrlFilter)
Liquid::Template.register_filter(Shopify::Filters::TFilter)
Liquid::Template.register_filter(Shopify::Filters::JsonFilter)
Liquid::Template.register_tag('form', Shopify::Tags::FormTag)

