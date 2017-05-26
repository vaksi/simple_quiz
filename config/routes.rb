Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "dashboard#index"
  get :dashboard, to: 'dashboard#index'

  get 'sessions/new'
  get    '/signup',   to: 'users#new'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'

  namespace :teacher do
    resources :courses
    get 'quizzes/:id/questions', to: 'quizzes#questions_by_quiz_id'
    resources :quizzes
    resources :questions
  end
  namespace :teacher do
    
  end
  resources :users
end
