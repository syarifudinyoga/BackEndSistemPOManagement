class RegisMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.regis_mailer.new_regis.subject
  #
  
  def new_regis(user)
    @user = user 
    mail(to: user.email, 
        subject: "PO Management System", 
        from: 'pomanagementsystem@gmail.com',
        content_type: "text/html",
        body: "<h4>Welcome to PO Management System, "+user.name+"</h4>
        <p>
          You have registered to PO Management System,<br><br>
          <b>Username : "+user.username+"<b><br><br>
          <b>Password : "+user.password+"<b><br>
        </p>
        <p>Have a great day!</p>"
        ) 
  end
end
