ChimeForChange::Application.routes.draw do

  get 'sms', to: 'sms#receive'
  # The priority is based upon order of creation:
  # first created -> highest priority.

  root :to => 'messages#index'

  resources :messages

end
