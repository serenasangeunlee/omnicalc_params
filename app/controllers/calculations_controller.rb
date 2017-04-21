class CalculationsController < ApplicationController

  def flex_square
    # params = ["the_number"=>"25"]
    @user_provided_number = params["the_number"].to_f
    @squared_number = @user_provided_number ** 2
    render("calculations/flex_square.html.erb")
  end

  def flex_square_root
    # params = ["the_number"=>"25"]
    @user_provided_number = params["the_number"].to_f
    @square_rooted_number = @user_provided_number ** 0.5
    render("calculations/flex_square_root.html.erb")
  end

  def flex_payment
    # params = ["the_number"=>"25"]
    @user_provided_year = params["the_year"].to_f
    @user_provided_loan = params["the_loan"].to_f
    @user_provided_rate = params["the_rate"].to_f
    @monthly_payment = ((@user_provided_rate/ 100 / 12) * @user_provided_loan) / (1 - ((1 + (@user_provided_rate / 100 / 12)) ** (-@user_provided_year * 12)))
    render("calculations/flex_payment.html.erb")
  end

  def square_form
    render("calculations/square_form.html.erb")
  end

  def square
    # params = ["number_to_be_squared"=>"42"]
    @user_provided_number = params["number_to_be_squared"].to_f
    @squared_number = @user_provided_number ** 2
    render("calculations/square.html.erb")
  end

  def square_root_form
    render("calculations/square_root_form.html.erb")
  end

  def square_root
    # params = ["number_to_be_squared"=>"42"]
    @user_provided_number = params["number_to_be_squared"].to_f
    @square_rooted_number = @user_provided_number ** 0.5
    render("calculations/square_root.html.erb")
  end

end
