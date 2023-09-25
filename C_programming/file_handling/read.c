#include<stdio.h>
int main()
{
  FILE *fp=fopen("write.txt","r");
  fgets("s",32,fp);
  fprintf(fp,"%s");
  fclose(fp);
}
