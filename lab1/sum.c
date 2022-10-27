//CS 120 - lab 1
//Satvik Kukreti

#include <stdio.h>

#define MAX 10

int main()
{
  int sum, i;

  sum = 0;
  for (i = 1; i <= MAX; i++)
    sum += i;

  printf("The sum from 1 to %d is %d\n", MAX, sum);
}
