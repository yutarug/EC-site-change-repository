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
    resources :end_users, :only => [:index,:show,:edit,:update]
    resources :genres, :only => [:index,:create,:edit,:update]
    resources :items, :only => [:index,:create,:new,:show,:edit,:update]
  	#get "top" => "#top"
  end

  namespace :public,path: "" do
    root to:"end_users#top"
    get "/end_users/confirm" => "end_users#confirm"
    get "/end_users/my_page" => "end_users#show",as: "end_user"
    get "end_users/my_page/edit" => "end_users#edit",as: "edit_end_user"
    delete "carts_destroy" => "cart_items#destroy_all"
    resources :end_users, :only => [ :update, :destroy]
    resources :items, :only => [:index,:show]
    resources :cart_items, :only => [:index,:create,:update,:destroy]
  end
end
