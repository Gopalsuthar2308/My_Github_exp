#include<stdio.h>
#include<string.h>
int main()
{
  int l,i;
  char s1[10],s[10]="gopal";
  l=strlen(s);
  printf("l=%d\n",l);
  for(i=0;i<l;i++)
  {
    s1[i]=s[l-1-i];
    //s1=s[i]+s1;
  }
  printf("reverce string is = %s\n",s1);
}

