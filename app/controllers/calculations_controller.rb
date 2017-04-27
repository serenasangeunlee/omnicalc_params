class CalculationsController < ApplicationController

  def flex_square
    @user_provided_number = params["the_number"].to_i
    @squared_number = @user_provided_number ** 2
    render("calculations/flex_square.html.erb")
  end

  def flex_square_root
    @user_provided_number = params["the_number"].to_i
    @square_rooted_number = @user_provided_number ** 0.5
    render("calculations/flex_square_root.html.erb")
  end

  def flex_payment
    @basis_points = params["basis_points"].to_f
    @number_of_years = params["number_of_years"].to_i
    @present_value = params["present_value"].to_i
    @monthly_payment = ((@basis_points / 100 / 12) * @present_value) / (1 - ((1 + (@basis_points / 100 / 12)) ** (-@number_of_years * 12)))
    render("calculations/flex_payment.html.erb")
  end

  def my_rand(x, y); rand(y-x) + x;
  end

  def flex_random
    @user_provided_min = params["min"].to_i
    @user_provided_max = params["max"].to_i
    @random_number = my_rand(@user_provided_max, @user_provided_min)
    render("calculations/flex_random.html.erb")
  end

  def square_form
    render("calculations/square_form.html.erb")
  end

  def square
    # params = ["number_to_be_squared"=>"42"]
    @user_provided_number = params["number_to_be_squared"].to_i
    @squared_number = @user_provided_number ** 2
    render("calculations/square.html.erb")
  end

  def square_root_form
    render("calculations/square_root_form.html.erb")
  end

  def square_root
    @user_provided_number = params["number_to_be_squared"].to_i
    @square_rooted_number = @user_provided_number ** 0.5
    render("calculations/square_root.html.erb")
  end

  def payment_form
    render("calculations/payment_form.html.erb")
  end

  def payment
    @basis_points = params["basis_points"].to_f
    @number_of_years = params["number_of_years"].to_i
    @present_value = params["present_value"].to_i
    @monthly_payment = ((@basis_points / 100 / 12) * @present_value) / (1 - ((1 + (@basis_points / 100 / 12)) ** (-@number_of_years * 12)))
    render("calculations/payment.html.erb")
  end

  def random_form
    render("calculations/random_form.html.erb")
  end

  def random
    @user_provided_min = params["min"].to_i
    @user_provided_max = params["max"].to_i
    @random_number = my_rand(@user_provided_max, @user_provided_min)
    render("calculations/random.html.erb")
  end

  def word_count_form
    render("calculations/word_count_form.html.erb")
  end

  def word_count
    @text = params["text"]
    @special_word = params["special_word"]
    @word_count = @text.split.count
    @character_count_with_spaces = @text.length - @text.count("\r")
    @character_count_without_spaces = @text.gsub(" ","").length - @text.count("\n") - @text.count("\r")
    @occurrences = @text.downcase.scan(@special_word.downcase).count
    render("calculations/word_count.html.erb")
  end

  def descriptive_strats_form
    render("calculations/descriptive_strats_form.html.erb")
  end

  def descriptive_strats
    render("calculations/descriptive_strats.html.erb")
  end

end
