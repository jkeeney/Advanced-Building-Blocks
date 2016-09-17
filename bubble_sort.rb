def bubble_sort(array)
	array_length = array.length
	
	swapped = true
	while swapped
		swapped = false
		(1...array_length).each do |position|
			first_value = array[position-1]
			second_value = array[position]
			if first_value > second_value
				array[position] = first_value
				array[position-1] = second_value
				swapped = true
			end
		end
	end
	array
end

def bubble_sort_by(array)
	array_length = array.length

	swapped = true
	while swapped
		swapped = false
		(1...array_length).each do |position|
			first_value = array[position-1]
			second_value = array[position]
			i = yield(first_value, second_value)
			if i > 0
				array[position] = first_value
				array[position-1] = second_value
				swapped = true
			end
		end
	end
	array
end

array_to_sort = [4,3,78,2,0,2]
puts "original array is: #{array_to_sort.inspect}"
puts "sorted array is: #{bubble_sort(array_to_sort).inspect}"

string_array_to_sort_by = ["hi","hello","hey"]
puts "orignial array is: #{string_array_to_sort_by.inspect}"
puts "sorted array is: #{bubble_sort_by(string_array_to_sort_by) {|left, right| left.length - right.length}.inspect}"
