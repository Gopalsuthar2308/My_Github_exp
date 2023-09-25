#def fact(x):
#  if(x==1):
#    return 1
#  else:
#    return (x*fact(x-1))
#
#n=input("enter number : ")
#print("fact of",n,"is = ",fact(n))


def fact(x):
  f=1
  while(x!=0):
    f=f*x
    x=x-1
  return f

n=input("enter number : ")
print("fact of",n,"is = ",fact(n))



