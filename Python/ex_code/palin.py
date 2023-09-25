s = input('enter palindrome string:')
print(s)
print(len(s))
temp = ""
for i in range(0,len(s)):
  temp=s[i]+temp
print(temp)
if(temp==s):
  print("string is palindrome")
else:
  print("string is not palindrome")
