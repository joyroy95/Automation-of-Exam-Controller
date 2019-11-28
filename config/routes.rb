Rails.application.routes.draw do
  resources :dummies
  resources :attendances
  resources :submitteds
  resources :course_types
  resources :batches, path: '/admin/batches'
  resources :admin_users
  resources :pets
  resources :registrations
  resources :courses
  resources :personal_infos
  get 'sessions/new'

  get '/signup', to: 'users#new'
  resources :users, path: '/students/users'

  resources :users, path: '/students/users' do
    resources :personal_infos
  end
  resources :users, path: '/students/users' do
    resources :registrations
  end
  resources :batches, path: '/admin/batches' do
    resources :courses do
      member do
        get 'delete'
      end
    end
  end


  get 'students/login', to: 'sessions#new'
  post 'students/login', to: 'sessions#create'
  delete 'students/logout', to: 'sessions#destroy'
  root 'sessions#new'
  resources :batches do
    member do
      get 'delete'
    end
  end

  resources :courses do
    member do
      get 'delete'
    end
  end

  resources :batches, path: '/admin/batches' do
    resources :submitteds
  end
  resources :batches, path: '/admin/batches' do
    resources :submitteds do
      resources :attendances do
        end
      end
  end


  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
