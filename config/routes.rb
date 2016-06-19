Rails.application.routes.draw do
  
    root 'items#index'
  
    resources :categories
    
    resources :items do
        get 'redefine' , to: 'items#redefine'
    end

end
