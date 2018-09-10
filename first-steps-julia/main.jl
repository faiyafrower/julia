using Pkg;
Pkg.add("Images");
Pkg.add("DataFrames");
Pkg.add("CSV");
Pkg.add("StatsBase");
Pkg.add("Plots");
Pkg.add("StatPlots");
using Images;
using DataFrames;
using CSV;
using StatsBase;
using Plots;
using StatPlots;

gr()

#Path to files and folders
path = "/Users/mishen/Documents/GitHub/julia/first-steps-julia"

#Read training data information
trainData = CSV.read("$(path)/trainlabels.csv");

# println(trainData)
# println(trainData[:Class])

#Count occurence of each character in training data
trainDataCounts = by(trainData, :Class, nrow);
trainDataCountsSort = sort(trainDataCounts, order(:x1))

# plot(trainDataCountsSort[:Row], trainDataCountsSort[:x1])
@df trainDataCountsSort plot(:Class, :x1)
