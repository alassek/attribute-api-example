Rails.application.routes.draw do
  resources :companies
  resources :notes
  resources :people

  root to: redirect('/people')
end
