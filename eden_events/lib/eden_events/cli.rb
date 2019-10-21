require 'pry'

class EdenEvents::CLI
  
  def call
    puts "welcome to Eden"
    get_user_month
  end
  
  def get_advertised_months
    @months = ['July, 2019', 'August, 2019', 'September, 2019', 'October, 2019', ]
  end
  
  def list_months
    @months.each.with_index do |month, index|
    puts "#{index + 1} #{month}"
  end
  end
  
end