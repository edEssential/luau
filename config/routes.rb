V1::Application.routes.draw do
  
  devise_for :users, path: "auth", path_names: { sign_in: 'login', sign_out: 'logout', sign_up: 'create_new_luau' }

  root :to => 'home#index'
  
  match "home/shortcodes" => 'home#shortcodes'
  match "home/blog" => 'home#blog'
  
  match 'artists/artist_show_via_ajax_call' => 'artists#artist_show_via_ajax_call'
  match 'releases/release_show_via_ajax_call' => 'releases#release_show_via_ajax_call'
  
  resources :cms
  resources :artists
  resources :releases
  resources :contacts
  
  match "contacts_xls" => 'cms#contacts_xls'

end