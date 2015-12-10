module Shopify
  module Filters
    module TFilter
      def t(input, context={})
        result = translations
        parts = input.split(/\./)
        while part = parts.shift
          result = result.send(part.to_sym)
        end
        result = render_translation_liquid(result, context)
        result
      rescue
        input
      end

      def render_translation_liquid(content, context)
        begin
          template = ::Liquid::Template.parse(content)
          result = template.render(context)
        rescue => e
          puts "Error rendering template (#{content}) | (#{context.inspect}): #{e.message}\n#{e.backtrace}"
          raise
        end
      end

      def translations
        return @translations if defined?(@translations)
        @translations = Hashie::Mash.new(JSON.parse(File.read(Rails.root.join('app/assets/javascripts/shopify-config/../locales/en.default.json'))))
      end
    end
  end
end


