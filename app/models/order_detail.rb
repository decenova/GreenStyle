class OrderDetail < ApplicationRecord
	belongs_to :product
	belongs_to :order

	validates :quantity, presence: true, numericality: { only_integer: true, greater_than: 0 }
  validate :product_present
	validate :order_present
	
	before_save :finalize

	def price
		if persisted?
			self[:price]
		else
			product.price
		end
	end

	def total_price
		price * quantity
	end

	private
	def product_present
		if product.nil?
			errors.add(:product, "không hợp lệ")
		end
	end
	def order_present
		if order.nil?
			errors.add(:order, "không hợp lệ")
		end
	end

	def finalize
		self[:price] = price
		self[:total_price] = quantity * self[:price]
	end
end
