class LiquidController < ApplicationController
  def products
    @layout = Liquid::Template.parse(layout_template)
    @template = Liquid::Template.parse(products_template)
    render text: @layout.render(variables.merge({'content_for_layout' => @template.render(variables)})), layout: nil, content_type: 'text/html'
  end

  def pages
    @layout = Liquid::Template.parse(layout_template)
    @template = Liquid::Template.parse(pages_template)
    render text: @layout.render(variables.merge({'content_for_layout' => @template.render(variables)})), layout: nil, content_type: 'text/html'
  end

  protected

  def variables
    return @variables if defined? @variables
    settings_json = File.read(Rails.root.join('app/assets/javascripts/shopify-config/settings_data.json'))
    settings = JSON.parse(settings_json)
    @variables = {
      'settings' => settings["current"],
      'template' => 'product.liquid',
      'product' => fixture('product.json')["product"],
      'linklists' => {
        'main-menu' => {
          'links' => [
            { 'url' => '#', 'title' => 'Eat'},
            { 'url' => '#', 'title' => 'Drink'},
            { 'url' => '#', 'title' => 'Sleep'},
            { 'url' => '#', 'title' => 'Bathe'},
          ]
        },
        'main-menu-right' => {
          'links' => [
            { 'url' => '#', 'title' => 'Our Approach'},
            { 'url' => '#', 'title' => 'Editorial'}
          ]
        }
      }
    }
  end

  def fixture(name)
    JSON.parse(File.read(Rails.root.join("app/fixtures/#{name}")))
  end

  def layout_template
    Shopify::AssetFileSystem.new.read_layout_file('theme.liquid')
  end

  def products_template
    Shopify::AssetFileSystem.new.read_template_file('product.liquid')
  end

  def pages_template
    Shopify::AssetFileSystem.new.read_template_file("page.#{params[:handle]}.liquid")
  end

end
