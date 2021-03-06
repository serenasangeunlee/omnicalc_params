class CalculationsController < ApplicationController

  def flex_square
    @user_provided_number = params["the_number"].to_i
    @squared_number = @user_provided_number ** 2
    render("calculations/flex_square.html.erb")
  end

  def flex_square_root
    @user_provided_number = params["the_number"].to_f
    @square_rooted_number = Math.sqrt(@user_provided_number).round(2)
    render("calculations/flex_square_root.html.erb")
  end

  def flex_payment
    @apr = params["apr"].to_f.round(6)/10000
    @year = params["year"].to_i
    @principal = params["total_amount"].to_i
    @monthly_payment = (@apr / 12 * @principal) / (1 - ((1 + @apr / 12 ) ** ((-1) * @year * 12)))
    render("calculations/flex_payment.html.erb")
  end

  def flex_random
    @user_provided_min = params["min"].to_i
    @user_provided_max = params["max"].to_i
    @random_number = (@user_provided_min + rand(@user_provided_max-@user_provided_min+1)).to_i
    render("calculations/flex_random.html.erb")
  end

  def square_form
    render("calculations/square_form.html.erb")
  end

  def square
    @user_provided_number = params["number_to_be_squared"].to_f
    @squared_number = @user_provided_number ** 2
    render("calculations/square.html.erb")
  end

  def square_root_form
    render("calculations/square_root_form.html.erb")
  end

  def square_root
    @number = params["number_to_be_square_rooted"].to_f
    @squared_rooted_number = Math.sqrt(@number)
    render("calculations/square_root.html.erb")
  end

  def payment_form
    render("calculations/payment_form.html.erb")
  end

  def payment
    @apr = params["apr"].to_f.round(6)/100
    @year = params["years"].to_i
    @principal = params["principal"].to_i
    @monthly_payment = (@apr / 12 * @principal) / (1 - ((1 + @apr / 12 ) ** ((-1) * @year * 12)))
    render("calculations/payment.html.erb")
  end

  def random_form
    render("calculations/random_form.html.erb")
  end

  def random
    @user_provided_min = params["min"].to_i
    @user_provided_max = params["max"].to_i
    @random_number = (@user_provided_min + rand(@user_provided_max-@user_provided_min+1)).to_i
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
