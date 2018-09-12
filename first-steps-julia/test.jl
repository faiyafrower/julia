# trainData = CSV.read("$(path)/trainLabels.csv"; types = [Int64)

# Pre-sort trainData by char
trainSort = sort(trainData, order(:Class))
# Then, summarizing provides correct ordering
trainCount = by(trainSort, :Class, nrow)

# Use matplotlib instead of GR Framework
pyplot()

# Initialize Char Array x
x = Array('0':'9')
for i in 'A':'Z'
    push!(x, i)
end
for i in 'a':'z'
    push!(x, i)
end

# Initialize equivalent String Array y
y = String[]
for i in 1:62
    push!(y, string(popfirst!(x)))
end

s = Array(0:61)
bar(trainCount[:x1], xticks=(s, y))
