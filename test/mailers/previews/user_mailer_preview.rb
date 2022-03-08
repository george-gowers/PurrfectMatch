# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/subscribtion_mailer
  def subscribtion_mailer
    UserMailer.subscribtion_mailer
  end

end
