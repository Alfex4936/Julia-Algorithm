include("./utils.jl")
using .utils

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
 
println("gnomeSort")
arr = genRandomArray(10000)
# for i = 1:10000
#     push!(arr, rand(-10000:10000))
# end

# println("# ORIGINAL: $arr")
@time gnomeSort(arr)
# println("-> SORTED: ", gnomeSort(arr))

println("Correctly sorted?: ", 🚨(arr))