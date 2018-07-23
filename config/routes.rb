Rails.application.routes.draw do
  resources :quote_messages
  resources :suppliers
  get 'settings/operations'
  get 'zone_item_groups/zone_groups'
  get 'delete_zone_group' => 'zone_item_groups#delete_zone_group'

  resources :zones
  resources :progress_shots
  resources :project_documents
  resources :variations do
    patch 'variation_quote' => 'variations#variation_quote'
    get 'variation_approve' => 'variations#variation_approve'
  end
  resources :tips
  resources :item_groups
  resources :items do
    get 'add_image' => 'items#add_image'
    get 'save_user_item' => 'items#save_user_item'
  end
  resources :post_replies
  resources :posts
  resources :documents
  resources :projects do
    post 'project_item' => 'projects#project_item'
    patch 'project_item_comment' => 'projects#project_item_comment'
    patch 'project_item_close' => 'projects#project_item_close'
    patch 'project_item_discuss' => 'projects#project_item_discuss'
    get 'project_item_approve' => 'projects#project_item_approve'
    get 'delete_project_item' => 'projects#delete_project_item'
    get 'confirm_project' => 'projects#confirm_project'
    resources :project_users, path: :users
  end

  resources :categories
  resources :clients
  devise_for :users

  get 'static/home'
  root to: "static#home"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
