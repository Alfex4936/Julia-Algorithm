include("./utils.jl")
using .utils

function countSort(A::AbstractVector)
	min_ = minimum(A)
	max_ = maximum(A) - min_

	buckets = [0 for _ = 1:max_]


	for i = 1:length(A)
		next = A[i] - min_
		if next == 0
			next = 1
		end
		buckets[next] += 1
	end

	index = 1
	for i = 1:length(buckets)
		while buckets[i] > 0
			A[index] = i + min_
			index += 1
			buckets[i] -= 1
		end
	end

	return A
end

println("countSort")
arr = genRandomArray(10000)
# for i = 1:10000
#     push!(arr, rand(-10000:10000))
# end

# println("# ORIGINAL: $arr")
@time countSort(arr)
# println("-> SORTED: ", countSort(arr))

println("Correctly sorted?: ", 🚨(arr))