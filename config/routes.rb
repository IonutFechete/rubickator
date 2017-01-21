Rails.application.routes.draw do
  get '/' => 'application#index', as: 'index'
  get '/propose_group' => 'application#propose_group', as: 'group'
  get '/propose_single' => 'application#propose_single', as: 'single'
end
