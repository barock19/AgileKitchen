AgileKitchen::Application.routes.draw do
  devise_for :users
  root :to => "application#root_page"
end
