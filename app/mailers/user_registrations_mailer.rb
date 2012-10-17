# encoding: utf-8
class UserRegistrationsMailer < ActionMailer::Base
  helper "spree/base"
  default_url_options[:host] = Spree::Config[:site_url]

  def registration_confirm(user)
    @user = user
    subject = "Вы успешно зарегистрировались в магазине Книгиподарки"
    mail(:to => user.email,
         :subject => subject,
         :template_name => 'confirm')
  end
end