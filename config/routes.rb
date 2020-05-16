Rails.application.routes.draw do

   devise_for :admins,path: "admin", controllers: {
  	sessions: "admin/sessions",
  	passwords:     'admin/passwords',
    registrations: 'admin/registrations'
  }

  devise_for :end_users, controllers:{
  	sessions:      'public/sessions',
    passwords:     'public/passwords',
    registrations: 'public/registrations'
  }


  namespace :admin do
    get "/top" => "top#top"
    resources :end_users
  	resources :genres
  end

  namespace :public,path: "" do
    root to:"end_users#top"
    get "/end_users/confirm" => "end_users#confirm"
    get "/end_users/my_page" => "end_users#show",as: "end_user"
    get "end_users/my_page/edit" => "end_users#edit",as: "edit_end_user"
    resources :end_users, :only => [ :update, :destroy]
    resources :items

  end
end
