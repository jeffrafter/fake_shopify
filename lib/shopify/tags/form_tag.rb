module Shopify
  module Tags
    class FormTag < ::Liquid::Block
      def initialize(tag_name, markup, tokens)
        super
      end

      def render(context)
        "<form>#{super}</form>"
      end
    end
  end
end

