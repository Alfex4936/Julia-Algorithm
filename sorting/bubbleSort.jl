include("./utils.jl")
using .utils

function bubbleSort(A::AbstractVector)
    isSorted = false
	count = 0
	while !isSorted
	    isSorted = true
	    for i = 1:length(A) - 1 - count
		    if A[i] > A[i + 1]
				A[i], A[i + 1] = A[i + 1], A[i]
			    isSorted = false
			end
		end
		count += 1
	end
	return A
end

println("bubbleSort")
arr = genRandomArray(10000)
# for i = 1:10000
#     push!(arr, rand(-10000:10000))
# end

# println("# ORIGINAL: $arr")
@time bubbleSort(arr)
# println("-> SORTED: ", bubbleSort(arr))

println("Correctly sorted?: ", 🚨(arr))
		