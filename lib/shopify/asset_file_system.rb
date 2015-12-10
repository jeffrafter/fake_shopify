module Shopify
  class AssetFileSystem
    def read_template_file(template_path)
      if template_path =~ /snippet/
        File.read("#{base_path}/snippets/#{template_path}.liquid")
      else
        File.read("#{base_path}/templates/#{template_path}")
      end
    end

    def read_layout_file(template_path)
      File.read("#{base_path}/layout/#{template_path}")
    end

    def read_asset_file(template_path)
      File.read(template_path)
    end

    def base_path
      "/Users/njero/Projects/snowe/snowe-theme/theme"
    end
  end
end
