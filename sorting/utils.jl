module utils

export 🚨, genRandomArray

	# isSorted
	function 🚨(A::AbstractVector)
		for i = 1:length(A) - 1
			if A[i] > A[i + 1]
				return false
			end
		end
		return true
	end

	function genRandomArray(size::Number)
		return [rand(-size:size) for _ = 1:size]
	end

end