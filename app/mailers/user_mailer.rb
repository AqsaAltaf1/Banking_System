class UserMailer < ApplicationMailer
  default :from => "aqsa1998@gmail.com"
  
  def example(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome in online banking')
  end

end
