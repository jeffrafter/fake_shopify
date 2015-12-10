module Shopify
  module Filters
    module StylesheetTagFilter
      def stylesheet_tag(input)
        if input == '//maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css'
          "<link href='/bootstrap.min.css' media='all' rel='stylesheet'>"
        elsif input == '//maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css'
          "<link href='/font-awesome.min.css' media='all' rel='stylesheet'>"
        else
          "<link href='#{input}' media='all' rel='stylesheet'>"
        end
      end
    end
  end
end


