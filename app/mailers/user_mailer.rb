class UserMailer < ApplicationMailer
    def order_email(input)
        @order = input
        @url  = 'no-reply@jungle.com'
        mail(to: @order.email, subject: `Thanks for the order! #{@order.id}`)
      end
end
