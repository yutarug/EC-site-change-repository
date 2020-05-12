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
  	#get "top" => "#top"
  end

  namespace :public,path: "" do
    root to:"end_users#top"
    resources :end_users
  end
end
