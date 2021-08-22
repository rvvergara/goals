Rails.application.routes.draw do
  namespace :v1, defaults: { format: :json } do
    resources :goals
  end
  post '/v1/goals/:id', to: 'v1/goals#update'
end
