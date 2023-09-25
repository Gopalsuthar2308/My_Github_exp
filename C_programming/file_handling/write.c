#include<stdio.h>
int main()
{
  FILE *fp=fopen("write.txt","w");
  fputs("my name is gopal suthar",fp);
  fclose(fp);
}
