class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation,:login
  acts_as_authentic do |c|
    c.login_field = :email
  end
end
