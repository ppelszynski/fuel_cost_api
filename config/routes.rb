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
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
