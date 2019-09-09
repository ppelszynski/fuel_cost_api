Rails.application.routes.draw do
  devise_for :users,
             path: '',
             path_names: {
               sign_in: 'login',
               sign_out: 'logout',
             },
             controllers: {
               sessions: 'sessions',
             }

  devise_scope :user do
    post "/sign_up" => "registrations#create"
  end

  jsonapi_resources :pb95s
end
