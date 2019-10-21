require 'pry'

class EdenEvents::CLI
  
  def call
    puts "\nwelcome to Eden\n"
    get_months
    list_months
    get_user_month
  end
  
  def get_months
    #@months = ['July, 2019', 'August, 2019', 'September, 2019', 'October, 2019']
    @months = EdenEvents::Month.all
    #binding.pry
  end
  
  def list_months
    puts "Choose a month to see events"
    @months.each.with_index(1) do |month, index|
    puts "#{index + 1}. #{month.name}"
  end
  end
  
  def get_user_month
    chosen_month = gets.strip.to_i
   show_events_for(chosen_month) if valid_input(chosen_month, @months)
  end
  
  def valid_input(input, date)
    input.to_i <= data.length && input.to_i > 0
  end
  
  def show_events_for(chosen_month)
    month = @months[chosen_month - 1]
    puts "Here are events for #{month}"
    binding.pry
  end
end