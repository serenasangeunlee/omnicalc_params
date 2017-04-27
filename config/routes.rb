Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get("/flexible/square/:the_number", { :controller => "calculations", :action => "flex_square" })
  get("/flexible/square_root/:the_number", { :controller => "calculations", :action => "flex_square_root" })
  get("/flexible/payment/:basis_points/:number_of_years/:present_value", { :controller => "calculations", :action => "flex_payment" })
  get("/flexible/random/:min/:max", { :controller => "calculations", :action => "flex_random" })

  get("/square/new", { :controller => "calculations", :action => "square_form" })
  get("/square/results", { :controller => "calculations", :action => "square" })

  get("/square_root/new", { :controller => "calculations", :action => "square_root_form" })
  get("/square_root/results", { :controller => "calculations", :action => "square_root" })

end
