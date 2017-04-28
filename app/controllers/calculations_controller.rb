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
    @basis_points = params["basis_points"].to_f.round(6)/10000
    @number_of_years = params["number_of_years"].to_i
    @present_value = params["present_value"].to_i
    @monthly_payment = (@basis_points / 12 * @present_value) / (1 - ((1 + @basis_points / 12 ) ** ((-1) * @number_of_years * 12)))
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
    @numbers = params["list_of_numbers"].gsub(",", "").split.map(&:to_f)
    @sorted_numbers = @numbers.sort
    @count = @numbers.count
    @minimum = @numbers.min
    @maximum = @numbers.max
    @range = @maximum - @minimum
    @list = @sorted_numbers.length
    if @list %2 != 0
      @median = @sorted_numbers[@list/2]
    else
      @median = (@sorted_numbers[@list/2] + @sorted_numbers[(@list/2)-1])/2.0
    end
    @sum = @numbers.sum
    @mean = @sum / @count
    @variance = 0
    @numbers.each do |x|
      @variance = @variance + ((x-@mean)**2)/@count
    end
    @standard_deviation = Math.sqrt(@variance)
    @freq = @numbers.inject(Hash.new(0)) {|h,v| h[v] += 1; h}
    @mode=@numbers.max_by { |v| @freq[v]}
    render("calculations/descriptive_strats.html.erb")
  end

end
