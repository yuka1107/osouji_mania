Rails.application.routes.draw do

  root 'inquiry#index'
  get  'inquiry/index'   => 'inquiry#index'
  post 'inquiry/confirm' => 'inquiry#confirm'
  post 'inquiry/thanks'  => 'inquiry#tha'
  
  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :users, controllers: {
    rgistrations: 'users/registrations',
    sessions:     'users/sessions',
    destroy:      'users/sessions/destroy'
  }

  namespace :admin do
    root to: 'admin/homes#top'
    resources :users, except:[:new, :create, :destroy]
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
    resources :users, only:[:show, :edit, :update]
    get 'users/unsubscribe' => 'users#unsubscribe'
    patch 'users/withdraw' => 'users#withdraw'
    resources :post_articles do
      resource :favorites, only: [:create, :destroy]
      resources :post_comments, only: [:create, :destroy]
    end
  end

end
