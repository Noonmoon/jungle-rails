class UserMailer < ApplicationMailer

  def order_email(order, id, email)
    @order = order
    @line_items = @order.line_items.all

    mail to: email,
         subject: "Order Number: #{id}"
  end

end
