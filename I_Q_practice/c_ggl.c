#include<stdio.h>
int swap(int num,int a,int b)
{
  num = num ^ (1<<a);
  num = num ^ (1<<b);
  return num;
}

int main()
{
  printf("swap val = %d\n",swap(15,1,5));
  return 0;
}
