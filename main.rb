require_relative 'dash_board'
require_relative 'authentication'
require_relative 'registration'

class Main
  bank_employee = Authentication.new
  bank_employee.user_authentication?("email", "password")
  
  if (bank_employee)
   dashboard = DashBoard.new
   dashboard.dash_service
  else
    puts "Incorrect email or password"
  end
    
end