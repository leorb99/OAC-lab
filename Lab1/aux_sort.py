from math import log
# from random import randint

# vectors = [[1, 2, 2, 3, 4, 5, 6, 7, 8, 9],
#            [9, 8, 7, 6, 5, 4, 3, 2, 2, 1],
#            [1, 1, 2, 2, 2, 2, 3, 3, 4, 5, 6, 6, 7, 8, 9, 10, 12, 32, 54, 78],
#            [78, 54, 32, 12, 10, 9, 8, 7, 6, 6, 5, 4, 3, 3, 2, 2, 2, 2, 1, 1],
#            [-4, 1, 1, 1, 2, 2, 2, 2, 2, 3, 3, 3, 4, 4, 5, 6, 6, 6, 7, 8, 9, 10, 12, 23, 31, 32, 54, 54, 54, 55],
#            [55, 54, 54, 54, 32, 31, 23, 12, 10, 9, 8, 7, 6, 6, 6, 5, 4, 4, 3, 3, 3, 2, 2, 2, 2, 2, 1, 1, 1, -4]]

# vec = [9,2,5,1,8,2,4,3,6,7,10,2,32,54,2,12,6,3,1,78,54,23,1,54,2,65,3,6,55,31,4,-4]

# for i in range(68):
#     vec.append(randint(-100,100))
#     if (len(vec) % 10) == 0:
#         vectors.append(sorted(vec))
#         vectors.append(sorted(vec, reverse=True))

# with open("a.txt", "w") as file:
#     for i in range(0,len(vectors),2):
#         for j in range(10):
#             file.write(f"VetorSorted{j+1}: .word {str(vectors[i]).strip('[]')}\n")
#             file.write(f"VetorInverted{j+1}: .word {str(vectors[i+1]).strip('[]').replace(' ', '')}\n")
#             break

x = [10,20,30,40,50,60,70,80,90,100]
y = [0.000173,0.0006812,0.0015298,0.0027792,0.0043788,0.0063358,0.0086652,0.0113494,0.0143936,0.0178004]
w = [log(i)  for i in x]
h = [log(i)  for i in y]
# print([i for i in w])
# print([j for j in h])
print(sum(w))
print(sum([k**2 for k in w]))
print(sum([i*j for i,j in zip(w,h)]))