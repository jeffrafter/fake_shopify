module Shopify
  module Filters
    module JsonFilter
      def json(input)
        if input.is_a?(String)
          JSON.parse(input).to_json
        else
          input.to_json
        end
      rescue
        "\"#{input}\""
      end
    end
  end
end


