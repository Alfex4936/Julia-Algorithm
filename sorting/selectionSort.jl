function selectionSort(A::AbstractVector)
	for currentIdx = 1:length(A) - 2
		smallestIdx = currentIdx
		for i = currentIdx + 1:length(A)
			if A[i] < A[smallestIdx]
				smallestIdx = i
			end
		end
		A[currentIdx], A[smallestIdx] = A[smallestIdx], A[currentIdx]
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
 
println("selectionSort")
arr = [rand(-10000:10000) for _ = 1:10000]
# for i = 1:10000
#     push!(arr, rand(-10000:10000))
# end

# println("# ORIGINAL: $arr")
@time selectionSort(arr)
# println("-> SORTED: ", selectionSort(arr))

println("Correctly sorted?: ", 🚨(arr))
