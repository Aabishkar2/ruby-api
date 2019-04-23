Rails.application.routes.draw do
  devise_for :users
	namespace 'api' do
		resources :articles
		resources :sessions, only: [:create, :destroy]
	end
end
