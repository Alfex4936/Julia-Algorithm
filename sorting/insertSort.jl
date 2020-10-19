function insertSort(A::AbstractVector)
	for i = 2:length(A)
		j = i
		while j > 1 && A[j] < A[j - 1]
			A[j], A[j - 1] = A[j - 1], A[j]
			j -= 1
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
 
println("insertSort")
arr = [rand(-10000:10000) for _ = 1:10000]
# for i = 1:10000
#     push!(arr, rand(-10000:10000))
# end

# println("# ORIGINAL: $arr")
@time insertSort(arr)
# println("-> SORTED: ", insertSort(arr))

println("Correctly sorted?: ", 🚨(arr))
