class Order < ApplicationRecord
	has_many :order_details
	belongs_to :user
	belongs_to :order_status


	before_create :set_order_status
	before_save :update_total_price

	def total_price
		order_details.collect { |od| od.valid? ? (od.quantity * od.price) : 0}.sum
	end

	private
	def set_order_status
			self.order_status_id = 1
	end
	def update_total_price
			self[:total_price] = total_price
	end
end
