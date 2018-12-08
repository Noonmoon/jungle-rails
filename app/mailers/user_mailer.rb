class UserMailer < ApplicationMailer

  def order_email(order, id, email)
    @order = order
    @id = id
    @email = email
    @line_items = @order.line_items.all

    mail to: 'tristandeering@hotmail.com',
         subject: "Order Number: #{@id}"
  end
end
