Rails.application.routes.draw do
  root 'pages#welcome'

  # Within a shop
  scope module: :shopify do
    scope module: :shop do
      # get '/password'
      get '/' to: 'home#index'
      get '/blogs', to: 'blogs#index'
      get '/blogs/:handle', to: 'blogs#show'
      get '/blogs/:handle/tagged/:tag', to: 'blogs#tagged'
      get '/blogs/:handle/:article', to: 'blogs#article'
      get '/cart', to: 'cart#index'
      get '/collections', to: 'collections#index'
      get '/collections/:collection', to: 'collections#show'
      get '/collections/:collection/products/:handle', to: 'products#show'
      get '/products', to: 'collections#index'
      get '/products/:handle', to: 'products#show'
      get '/search', to: 'search#show'
      get '/pages/:handle', to: 'pages#show'
      get '/account', to: 'account#show'
      get '/account/addresses', to: 'account#addresses'
      get '/account/orders/:token', to: 'account#order'
    end
  end

  # Within the admin
  scope module: :shopify do
    scope path: '/admin', module: :admin do
      get '/', to: 'home#index'
      get '/apps/:token', to: 'apps#index'
      get '/apps/:handle', to: 'apps#index'
      get '/embed/*', to: 'embed#index'
    end
  end

  # Within an app
  scope module: :shopify do
    scope path: '/apps', module: :app do
    end
  end

  # Api
  scope module: :shopify do
    scope path: '/admin', module: :admin do
      scope path: '/api', module: :api do
      end
    end
  end

end
