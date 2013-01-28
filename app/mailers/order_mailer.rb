# encoding: utf-8
class OrderMailer < ActionMailer::Base
  helper "spree/base"
  default_url_options[:host] = Spree::Config[:site_url]

  def confirm_email(order, user, resend=false)
    @order = order
    @user = user
    subject = (resend ? "[RESEND] " : "")
    subject += "КнигиПодарки. #{t('subject', :scope =>'order_mailer.confirm_email')} ##{order.number}"
    mail(:to => order.email,
         :subject => subject,
         :template_name => 'confirm')
  end
  
  def confirm_email_admin(order, user, resend=false)
    @order = order
    @user = user
    subject = (resend ? "[RESEND] " : "")
    subject += "КнигиПодарки. #{t('subject', :scope =>'order_mailer.confirm_email')} ##{order.number}"
    mail(:to => 'support@knigipodarki.ru',
         :subject => subject,
         :template_name => 'confirm')
  end  

  def cancel_email(order, resend=false)
    @order = order
    subject = (resend ? "[RESEND] " : "")
    subject += "КнигиПодарки. #{t('subject', :scope => 'order_mailer.cancel_email')} ##{order.number}"
    mail(:to => order.email,
         :subject => subject)         
  end
  
  def cancel_admin_email(order, resend=false)
    @order = order
    subject = (resend ? "[RESEND] " : "")
    subject += "КнигиПодарки. Заказ ##{order.number} отменен"
    mail(:to => 'help@knigipodarki.ru',
         :subject => subject)         
  end  
end
