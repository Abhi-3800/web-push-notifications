Rails.application.routes.draw do
  root 'users#index'
  post 'users/fcm_push_notification'
end
