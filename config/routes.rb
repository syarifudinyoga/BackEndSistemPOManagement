Rails.application.routes.draw do
  resource :users, only: [:create]
  post "/login/auth" => "users#login"
  get "/auto_login" => "users#auto_login"
  get "/users/show" => "users#show"
  post "/users/add" => "users#add"
  get "users/show/:id" => "users#showByID"
  put 'users/update/:id' => 'users#update'
  delete 'users/delete/:id' => 'users#delete'
  get 'users/search/:name' => 'users#search'
  get 'users/search/' => "users#show"

  #get 'home/index'
  #root 'home#index'
  
  #Clien
  get 'clien/show' => 'clien#show'
  post 'clien/add' => 'clien#add'
  get 'clien/show/:id' => 'clien#showByID'
  put 'clien/update/:id' => 'clien#update'
  delete 'clien/delete/:id' => 'clien#delete'
  get 'clien/search/:client_name' => 'clien#search'
  get 'clien/search/' => 'clien#show'
  get 'clien/countAll' => 'clien#allClient'
  
  #employee
  get 'employee/show' => 'employee#show'
  post 'employee/add' => 'employee#add'
  get 'employee/show/:id' => 'employee#showByID'
  put 'employee/update/:id' => 'employee#update'
  delete 'employee/delete/:id' => 'employee#delete'
  get 'employee/search/:nik_name' => 'employee#search'
  get 'employee/search/' => 'employee#show'
  get 'employee/countAll' => 'employee#allEmployee'
  get 'employee/countAllEmployeeWork' => 'employee#countAllEmployeeWork'
end
