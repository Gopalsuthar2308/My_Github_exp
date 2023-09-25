#include<stdio.h>
int main() {
  int arr[10];
  //int n;
 // printf("enter the value of n\n");
 // scanf("%d",&n);
  //function(arr,10,5);

  function(arr,5);
}

  int function(int array[], int n)
  {
    int i,j;
    for(i=0;i<n;i++){
      array[i]=i+1;}
    //for(j=0;i<size;j++){
    //  printf("arr[%d] = %d\n",j,array[j]);}

    for(i=0;i<10;i++)
      printf("arr = %0d\n",array[i]);
  }
