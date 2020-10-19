function gnomeSort(A::AbstractVector)
	index = 1
	while index <= length(A)
		if index == 1 || A[index] >= A[index - 1]
			index += 1
		else
			A[index], A[index - 1] = A[index - 1], A[index]
			index -= 1
		end
	end
	return A
end


# isSorted
function 🚨(A::AbstractVector)
	for i = 1:length(A) - 1
		if A[i] > A[i + 1]
			return false
		end
	end
	return true
end
 
println("gnomeSort")
arr = [rand(-10000:10000) for _ = 1:10000]
# for i = 1:10000
#     push!(arr, rand(-10000:10000))
# end

# println("# ORIGINAL: $arr")
@time gnomeSort(arr)
# println("-> SORTED: ", gnomeSort(arr))

println("Correctly sorted?: ", 🚨(arr))