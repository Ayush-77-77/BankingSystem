class Authentication
  # constructor with default value as email and password
  def initialize
    @email = test@gmail.com
    @password = test
  end    

  # method to authenticate, the email and password is correct or not given by the user
  def user_authentication(email, password)
    valid_user =  @email==email && @password==password ? true : false
    return valid_user
  end
end