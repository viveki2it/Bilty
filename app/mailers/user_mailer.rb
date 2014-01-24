class UserMailer < ActionMailer::Base
  default from: "from@example.com"
  
  def user_link(user,company)
    @user = user
    @company = company
    mail(:to => @user.email, :subject => "Company #{@company.business_name} created you")
  end
end
