require_relative 'active_record'
require_relative 'circle'
class Payment < ActiveRecord::Base
	belongs_to :service
	def self.with(line_item_id, service_id)
		#Will create a @payment object by looking at the database and matching the params, else @payments will be null
		@payment = Payment.where("line_item_id = line_item_id", "service_id = service_id")
		#creates a new object in the database unless @payment is not null, that is, if there is already a @payment it doesn't create
		Payment.create line_item_id: line_item_id, service_id: service_id unless @payment != null 
		

		#Code for updating payment (the bulk of old code as per specifications)
		#If there was no payment initially under the params, now there is, and if there was, it was not duplicated
		#So the update can be used in the same way as before, without changing any logic of the old code


	end
end
Payment.with(ARGV[0],ARGV[1])