# Preview all emails at http://localhost:3000/rails/mailers/user_mailer
class UserMailerPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/user_mailer/subscription_mailer
  def subscription_mailer
    user = User.create
    user.email = 'test@test.com'

    UserMailer.with(user: user, counted_users: User.count).subscription_mailer
  end

end
