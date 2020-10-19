function quickSort(A::AbstractVector, lo::Integer, hi::Integer)
	while hi > lo
		p = partition(A, lo, hi)
		quickSort(A, lo, p)
		lo = p + 1
	end
	return A
end

function partition(A::AbstractVector, lo::Integer, hi::Integer)
	pivot = A[(lo+hi)÷2]
	# ÷ integer divide like //
	i = lo - 1
	j = hi + 1
	while true
		i += 1
		while A[i] < pivot
			i += 1
		end
		j -= 1
		while A[j] > pivot
			j -= 1
		end

		if i >= j
			return j
		end

		A[i], A[j] = A[j], A[i]
	end
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
 
println("quickSort")
arr = [rand(-10000:10000) for _ = 1:10000]
# for i = 1:10000
#     push!(arr, rand(-10000:10000))
# end

# println("# ORIGINAL: $arr")
@time quickSort(arr, 1, length(arr))
# println("-> SORTED: ", quickSort(arr))

println("Correctly sorted?: ", 🚨(arr))