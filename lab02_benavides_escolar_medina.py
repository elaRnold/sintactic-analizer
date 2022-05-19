def eval(xi, exp)
ans = False
for i in range(len(exp)) :
part =? True
for j in range(len(exp[i])) :
part = part and xi[exp[i][j]]
ans = ans or part
return ans