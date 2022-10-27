//Satvik Kukreti
#include <stdio.h>

void printbits(int n)
{
  for (int i = 7; i >= 0; --i)
    {
      if (n & (1 << i))
	printf("1");
      else
	printf("0");
    }
  printf("\n");
}

int main()
{
  printbits(37);
  printbits(-41);
  printbits(0xF3);
}
