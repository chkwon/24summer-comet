pairs = Array{Tuple{Int64, Int64}}(undef,3)
pairs[1] = (1,2)
pairs[2] = (2,3)
pairs[3] = (3,4)

pairs

pairs = [(1,2), (2,3), (3,4)]

ijk_array = Array(Tuple{Int64, Int64, Int64})(undef, 3)
ijk_array[1] = (1,2,3)
ijk_array[2] = (2,3,4)
ijk_array[3] = (3,4,5)