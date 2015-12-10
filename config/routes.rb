Rails.application.routes.draw do
  root 'pages#welcome'

  get '/collections/:collection/products/:handle', to: 'liquid#products', as: :shopify_products
  get '/pages/:handle', to: 'liquid#pages', as: :shopify_pages
end
