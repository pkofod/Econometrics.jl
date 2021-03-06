using Optim
"""
    xopt, fopt, converged = fminunc(obj, startval)

Minimize the function obj, starting at startval.

fminunc() with no arguments will run an example, execute edit(fminunc,()) to see the code.
fminunc() uses Optim.jl to do the actual minimization.

"""

# unrestricted OLS using optimize (Optim)
function fminunc(obj, x)
    results = Optim.optimize(obj, x, LBFGS(), 
                            Optim.Options(
                            g_tol = 1e-5,
                            x_tol=1e-5,
                            f_tol=1e-9))
    return results.minimizer, results.minimum, Optim.converged(results)
end

function fminunc()
    println("with no arguments, fminunc() runs a simple example")
    println("type edit(fminunc, ()) to see the example code")
    # return of objective should be real valued, thus the [1] to pull value out of 1-dim array
    obj = x -> (x.^2)[1]
    # obj = x -> x'x # this would also work, as returns a Float64
    x = [2.0] # argument to objective function should be a vector, thus the brackets
    results = fminunc(obj, x)
end


