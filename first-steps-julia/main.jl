using Pkg;
#=
Pkg.add("Images");
Pkg.add("DataFrames");
Pkg.add("CSV");
Pkg.add("StatsBase");
Pkg.add("Plots");
Pkg.add("PyPlot");
Pkg.add("PyCall");
Pkg.add("LaTeXStrings");
=#
using Images;
using DataFrames;
using CSV;
using Plots;
# using PyPlot, PyCall, LaTeXStrings;
using StatsBase;

plotly()
# pyplot()
# gr()

function pushCharArray!(i::Char, j::Char, charArray)
    for char in i:j
        push!(charArray, char)
    end

    return charArray
end

#Path to files and folders
# macOS Path
# path = "/Users/mishen/Documents/GitHub/julia/first-steps-julia"
# Ubuntu Path
path = "/home/mishen/Documents/julia/first-steps-julia"

#Read training data information
trainData = CSV.read("$(path)/trainLabels.csv";
                    	 header = ["ID", "char"],
                         datarow = 2,
                         types = [Int64, Char]);

# println(trainData)
# println(trainData[:char])

# Sort trainData by char, then count occurences
trainSort = sort(trainData, order(:char))
trainCount = by(trainSort, :char, nrow)

# println(trainCount)

# Make bar plot viz of trainCount
xAxisNums = Array(1:62)

xAxisChars = Char[]
pushCharArray!('0', '9', xAxisChars)
pushCharArray!('A', 'Z', xAxisChars)
pushCharArray!('a', 'z', xAxisChars)

xAxisStrings = String[]
for i in 1:62
    push!(xAxisStrings, string(popfirst!(xAxisChars)))
end

trainBarPlot = Plots.bar(trainCount[:x1], xticks = (xAxisNums, xAxisStrings))
savefig("trainBarPlot.html")
# plot(trainDataCountsSort[:Row], trainDataCountsSort[:x1])
# @df trainDataCountsSort plot(:Class, :x1)
