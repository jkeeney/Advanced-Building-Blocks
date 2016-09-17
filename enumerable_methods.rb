module Enumerable

	def my_each
		i = 0
		while i < self.size
			yield(self[i])
			i += 1
		end
		self
	end

	def my_each_with_index
		i = 0
		while i < self.size
			yield(self[i], i)
			i += 1
		end
		self
	end

	def my_select
		result_array = []
		self.my_each do |i|
			result_array << i if yield(i)
		end
		result_array
	end

	def my_all?
		self.my_each do |i|
			return false if !yield(i)
		end
		true
	end

	def my_any?
		self.my_each do |i|
			return true if yield(i)
		end
		false
	end

	def my_none?
		self.my_each do |i|
			return false if yield(i)
		end
		true
	end

	def my_count(match=nil)
		if block_given?
			result_array = []
			self.my_each do |i|
				result_array << i if yield(i)
			end
			return result_array.size
		elsif match == nil
			return self.size
		else
			return self.my_select{|i| i == match}.size
		end
	end

	def my_map
		result_array = []

		if block_given?
			self.my_each do |i|
				result_array << yield(i)
			end
			result_array
		else
			self.to_enum
		end
	end

	def my_inject(value = nil)
		self.my_each do |i|
			if value == nil
				value = self[0]
			else
				value = yield(value, i)
			end
		end
		value
	end

end

def multiply_els (array)
	array.my_inject{ |running_total, item| running_total * item }
end


