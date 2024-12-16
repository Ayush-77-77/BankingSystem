require_relative 'dash_board'
require_relative 'authentication'
require_relative 'registration'
require_relative 'member_details'

class Main
  
  def login()
    bank_employee = Authentication.new
    bank_employee.user_authentication?("email", "password")
    if (bank_employee==true)
      dashboard = DashBoard.new
      dashboard.dash_service
    else
      puts "Email or password is wrong"
    end
  end
   
   
    
end

Main.new.login()  
  
