# ln -s ~/Projects/snowe/snowe-theme/theme/assets app/assets/stylesheets/shopify-assets
# ln -s ~/Projects/snowe/snowe-theme/theme/assets app/assets/javascripts/shopify-assets
# ln -s ~/Projects/snowe/snowe-theme/theme/config app/assets/javascripts/shopify-config

module Shopify
  module Filters
    module AssetUrlFilter
      def asset_url(input)
        input.gsub!(/.scss.css/, '.scss')

        if File.exists?("#{stylesheets_base_path}/shopify-assets/#{input}.liquid")
          render_stylesheet_liquid(input)
          "/assets/#{input}"
        elsif File.exists?("#{javascript_base_path}/shopify-assets/#{input}.liquid")
          render_javascript_liquid(input)
          "/assets/#{input}"
        elsif File.exists?("#{base_path}/#{input}")
          "/assets/shopify-assets/#{input}"
        else
          input
        end
      end

      def render_liquid(input, path)
        begin
          template = ::Liquid::Template.parse(Shopify::AssetFileSystem.new.read_asset_file("#{path}/shopify-assets/#{input}.liquid"))
          result = template.render(context)
          File.open("#{path}/#{input}", 'w') do |f|
            f.write(result)
          end
        rescue => e
          puts "Error rendering template: #{e.message}\n#{e.backtrace}"
          raise
        end
      end

      def render_stylesheet_liquid(input)
        render_liquid(input, stylesheets_base_path)
      end

      def render_javascripts_liquid(input)
        render_liquid(input, javascript_base_path)
      end

      def base_path
        Rails.root.join("app/assets/stylesheets/shopify-assets").to_s
      end

      def stylesheets_base_path
        Rails.root.join("app/assets/stylesheets").to_s
      end

      def javascript_base_path
        Rails.root.join("app/assets/javascripts").to_s
      end

      def context
        settings_json = File.read(Rails.root.join('app/assets/javascripts/shopify-config/settings_data.json'))
        settings = JSON.parse(settings_json)
        {
          'settings' => settings["current"]
        }
      end
    end
  end
end

