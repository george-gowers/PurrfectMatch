class UserMailer < ApplicationMailer

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.subscribtion_mailer.subject
  #
  def subscribtion_mailer
    users = User.where(subscribe: true)
    @counted_users = User.count
    mail to: 'msafuler@gmail.com'
    users.each do |user|
      #mail to: user.email
    end
  end
end
