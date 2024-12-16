class Main
  
  
  bank_employee = Authentication.user_authentication("email", "password")
  if (bank_employee)
    DashBoard.bank_dashboard
  else
    puts "Incorrect email or password"
  end
    
end