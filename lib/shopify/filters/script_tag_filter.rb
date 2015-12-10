module Shopify
  module Filters
    module ScriptTagFilter
      def script_tag(input)
        if input == '//ajax.googleapis.com/ajax/libs/jquery/1.11.0/jquery.min.js'
          "<script type='text/javascript' src='/jquery.min.js'></script>"
        elsif input == 'option_selection.js'
          "<script type='text/javascript' src='/option_selection.js'></script>"
        else
          "<script type='text/javascript' src='#{input}'></script>"
        end
      end
    end
  end
end


