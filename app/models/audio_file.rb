class AudioFile < ApplicationRecord

	def timestamp
		self.created_at.strftime("%m/%d/%Y %H:%M%p")
	end

	def address_string
		if self
			# self.street_number + ' ' +  self.street_name + ', ' + self.city + ', ' + self.state + ' ' + self.postal_code  
			"#{self.street_number} #{self.street_name}, #{self.city}, #{self.state} #{self.postal_code}"
 		end
 	end
end
