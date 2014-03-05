Rails.application.routes.draw do
  post '/dismissible_blocks' => 'dismissible_blocks#create'
end
