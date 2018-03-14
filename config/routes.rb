Rails.application.routes.draw do
  put '/dismissible_blocks' => 'dismissible_blocks#create'
end
