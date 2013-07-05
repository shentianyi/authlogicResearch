class UserSession < Authlogic::Session::Base
   attr_accessor :email,:password,:remember_me
   #find_by_login_method :find_by_email
end