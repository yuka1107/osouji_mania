Rails.application.routes.draw do

  devise_for :admins, controllers: {
    sessions: 'admins/sessions'
  }

  devise_for :users, controllers: {
    rgistrations: 'users/registrations',
    sessions: 'users/sessions',
    destroy: 'users/sessions/destroy'
  }

  namespace :admin do
    root to: 'admin/homes#top'
  end

  scope module: :public do
    root to: 'homes#top'
    get 'about' => 'homes#about'
  end

end
