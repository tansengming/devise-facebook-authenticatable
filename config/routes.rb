FbAuthenticatable::Application.routes.draw do
  devise_for :users, :controllers => { :omniauth_callbacks => "users/omniauth_callbacks" } do
    get "/logout" => "devise/sessions#destroy"
  end

  resources :users, :only => [] do
    collection do
      get :sign_in
      get :welcome
    end
  end

  root :to => 'users#welcome'
end
