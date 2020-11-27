module ApplicationHelper

  def tax_include(price)
    return (price*1.1).floor
  end

	def sub_total_price(cart)
		return cart
	end

	def total_price(carts)
	   total_price =0
	   carts.each do |cart|
	     total_price += tax_include(cart.item.price)*cart.amount
	     end
	     return total_price
	end
	
	def total_price_detail(order_details)
	   total_price =0
	   order_details.each do |order_detail|
	     total_price += order_detail.purchase_price*order_detail.amount
	     end
	     return total_price
	end
	
	def total_amount(order_details)
		total_amount =0
		order_details.each do |order_detail|
			total_amount += order_detail.amount
		end
		return total_amount
	end




end
