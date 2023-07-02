a = [155,115]
b = [65,35]
c = [250,42]
d = [80,210]
e = [220,210]
f = [155,22]

v = [a,b,c,d,e,f]
for j in range(len(v)):
    for i in range(len(v)):
        print(f"{((v[j][0]-v[i][0])**2+(v[j][1]-v[i][1])**2)**0.5:.3f}", end="\t")
    print()

