class ALEHelp

	def self.hello
		p "Hello wolrd."
	end

	def validate_email(email)
		unless email.match(/\w{1,}@\w{1,}\.\w{2,}/).nil?
			true
		else
			false
		end
	end

end