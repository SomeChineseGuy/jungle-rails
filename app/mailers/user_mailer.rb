class UserMailer < ApplicationMailer
  default from: 'noreply@jungle.com'

  def user_email(order)
    @order = order
    mail(to: order.email, subject: 'Your order has been placed!' + order.id.to_s)
  end

  
end
