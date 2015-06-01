Rails.application.routes.draw do
  get '/collections/:collection/products/:handle', to: 'liquid#products', as: :shopify_products
end
