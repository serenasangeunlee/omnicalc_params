Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get("/flexible/square/5", { :controler => "calculations", :action => "flex_square" })

end
