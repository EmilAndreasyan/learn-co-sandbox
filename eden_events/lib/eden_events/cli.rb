require 'pry'

class EdenEvents::CLI
  
  def call
    puts "\nwelcome to Eden\n"
    get_months
    list_months
    get_user_month
  end
  
  def get_months
    @months = ['July, 2019', 'August, 2019', 'September, 2019', 'October, 2019', ]
  end
  
  def list_months
    puts "Choose a month to see events"
    @months.each.with_index do |month, index|
    puts "#{index + 1}. #{month}"
  end
  end
  
  def get_user_month
    chosen_month = gets.strip
    #binding.pry
    # if valid_input(chosen_month)
    # end
  end
  
  def valid_input(input, date)
    input.to_i <= data.length && input.to_i > 0
  end
end