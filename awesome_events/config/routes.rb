Rails.application.routes.draw do
  root 'welcome#index'
  get '/auth/:provider/callback', to: 'sessions#create'
  post '/auth/github', to: lambda { |_env| [404, {}, ['Not Found']] }
end
