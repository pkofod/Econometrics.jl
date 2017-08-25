y = rand(100,1)
x = [ones(100,1) rand(100,3)]
names = ["const" "x2"  "x3" "x4"]
ols(y,x)
ols(y,x,names=names)
ols(y,x,names=names, vc="nw")
b,junk,junk,junk = ols(y,x,silent=true)
show(b)
# restricted LS
R = [1 0 0 0]
r = 1
ols(y,x,R=R,r=r)


