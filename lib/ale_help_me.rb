class ALEHelpMe

	CONSTANTS = {"PI" =>3.1415926535897932384626433832795028841971693993751,
							 "G"  => 6.673e-11}

	def initialize
		true
	end

	def self.to_s
		"ALE help me do stuff!"
	end

	def to_s
		"ALE help me do stuff!"
	end

	def get_constants
		CONSTANTS.keys
	end

	def get_constant(constant)
		CONSTANTS[constant]
	end

	def get_pi(digits = nil)
		if digits.nil?
			PI
		else
			PI.round(digits)
		end
	end

	def validate_email(email)
		unless email.match(/\w{1,}@\w{1,}\.\w{2,}/).nil?
			true
		else
			false
		end
	end

	def complete_digits(number, digits)
		numer.to_s!
		while numer.lenght < digits
			number = "0" + number
		end
		number
	end

	def get_date_string
		time_now = Time.now
		y = time_now.year.to_s
		m += time_now.month.to_s
		d += time_now.day.to_s
		Date.new(y,m,d)
	end

	def get_date_string
		time_now = Time.now
		date_string = time_now.year.to_s
		date_string += complete_digits(time_now.month.to_s,2)
		date_string += complete_digits(time_now.day.to_s, 2)
		date_string
	end

	def time_stamp
		time_stamp = get_date_string + "-"
		time_now = Time.now
		time_stamp += time_now.hour.to_s
		time_stamp += time_now.minute.to_s
		time_stamp += time_now.second.to_s
		time_stamp
	end

	def turn_to_date(string)
		d = string[-2..-1].to_i 
		m = string[-4..-3].to_i 
		y = ""
		if string[-8..-5]
			y = string[-8..-5].to_i 
		else
			y = string[-6..-5].to_i
			if y > Time.now.year - 2000
				y += 1900
			else
				y +=2000
			end
		end
		Date.new(y,m,d)
	end

	def compare_strings(string1, string2)
		levenshtein(string1, string2)
	end

	private

	def levenshtein(first, second)
    matrix = [(0..first.length).to_a]
    (1..second.length).each do |j|
      matrix << [j] + [0] * (first.length)
    end
    (1..second.length).each do |i|
      (1..first.length).each do |j|
        if first[j-1] == second[i-1]
          matrix[i][j] = matrix[i-1][j-1]
        else
          matrix[i][j] = [
            matrix[i-1][j],
            matrix[i][j-1],
            matrix[i-1][j-1],
          ].min + 1
        end
      end
    end
    return matrix.last.last
  end

end