Rails.application.routes.draw do
  root 'home#index'

  scope '/api' do
    scope '/activities' do
      get '/' => 'api/api_activities#index'
      post '/' => 'api/api_activities#create'
    end
  end

end
