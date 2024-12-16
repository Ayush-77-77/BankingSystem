require_relative 'dash_board'
require_relative 'authentication'
require_relative 'registration'
require_relative 'member_details'

class Main
  
  def login()
    bank_employee = Authentication.new
    employee = bank_employee.user_authentication?("test@gmail.com", "test")
    if (employee == true)
      dashboard = DashBoard.new
      dashboard.dash_service
    else
      puts "Email or password is wrong"
    end
  end
   
   
    
end

Main.new.login()  
  
