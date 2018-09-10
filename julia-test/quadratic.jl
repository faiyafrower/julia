function quadratic(a::Float64, b::Float64, c::Float64)
    # typecast to complex for return type
    a = complex(a)
    b = complex(b)
    c = complex(c)

    r1 = -b + sqrt(b^2 - 4*a*c)/ 2*a
    r2 = -b - sqrt(b^2 - 4*a*c)/ 2*a
    return r1, r2
end

a, b, c = ARGS
println("Solving: ", a, "x^2 + ", b, "x +  ", c)

try
    parse(Float64, ARGS[1])
    parse(Float64, ARGS[2])
    parse(Float64, ARGS[3])
catch
    println("Wrong input type: Please enter a number")
    # println(typeof(a), " ", typeof(b), " ", typeof(c))
end

a = parse(Float64, ARGS[1])
b = parse(Float64, ARGS[2])
c = parse(Float64, ARGS[3])

sol1, sol2 = quadratic(a, b, c)
println("Sols: ", sol1, ", ", sol2)
