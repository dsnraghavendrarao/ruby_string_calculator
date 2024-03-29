class StringCalculator
	attr_accessor :input_str

	def add(input_str)
		@input_str = input_str
		raise ArgumentError, "Empty String !Should Pass commas seperated string" if @input_str.empty?
		@input_str = to_delimiter
		@input_str = delete_char_special_char
		validate_string
		result
	end

	def to_delimiter
	  @input_str = @input_str.gsub("[","").gsub("]","")
		@input_str.slice(0,2) == "//" ? @input_str[2..-1].gsub(";", ",") : @input_str
	end

	def delete_char_special_char
		@input_str.gsub(/[^0-9a-zA-Z,\n\-]/, "").gsub(/[a-zA-Z]+/, "")
	end

	def validate_string
		negative_numbers = @input_str.scan(/-\d+/)
  	raise ArgumentError, "Negative integers found: #{negative_numbers.join(",")}" unless negative_numbers.empty?
  	raise StandardError, "Invalid input: Empty entry between commas" if @input_str.split(",").include?("\n")  	
	end

	def result
		@input_str.gsub("\n",",").split(",").sum{|a| a.to_i}
	end
end


# StringCalculator.new.add("1\n2,3")
# StringCalculator.new.add("")
# StringCalculator.new.add("//;1\n;2")
# StringCalculator.new.add("-1,-2,\n")
# StringCalculator.new.add("\n")
# StringCalculator.new.add("//[A][b]\n1;2;3")


