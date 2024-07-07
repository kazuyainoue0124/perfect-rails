Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # 開発環境でのみSidekiqのWeb UIを有効にする（はず）
  # if Rails.env.development?
  #   require 'sidekiq/web'
  #   mount Sidekiq::Web => '/sidekiq'
  # end
end
