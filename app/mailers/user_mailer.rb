class UserMailer < ApplicationMailer
  default from: 'app252875010@heroku.com'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.subscribtion_mailer.subject
  #
  def weekly_summary
    users = User.where(subscribe: true)
    users.each do |user|
      UserMailer.with(user: user, counted_users: User.count).subscription_mailer.deliver_now
    end
  end

  def subscription_mailer
    @user = params[:user]
    @counted_users = params[:counted_users]
    mail(to: @user.email, subject: 'Weekly newsletter')
  end
end
