// Lab 9 - C code example
#include <stdio.h>

int x[] = {3, 55, 2, 7, 41, 0};

int main()
{
  int *s0 = x;
  int s1 = 0;  // Use this for the largest value
  int s2;

  // This while loop is implemented in an unusual
  // way, so that it's more clear what happens in
  // assembly. 
  while (s2 = *s0, s2 != 0)
    {
      if (s2 > s1)
	s1 = s2;

      // Move the s0 pointer
      // Note that the C compiler will quietly add
      // 4 to the pointer (because integers are 4 bytes).
      // You'll need to add 4 explicitly when you convert
      // to assembly language
      s0 = s0 + 1;
    }

  printf("Largest is %d\n", s1);
}

// Some more information on the while loop:
// In C, you can connect multiple statements together
// with a comma (most of the time, you'll have
// semicolons).
//
// In the while loop, the "s2 = *s0" gets the
// value pointed to by t0.  It's essentially a
// lw $s2, 0($s0)
// assembly statement.
//
// The comparison s2 != 0 after the comma is
// what the while loop will use to decide if we
// should go into the loop and do the work, or
// exit the loop.
//
// Typically, a C programmer might write this instead
// while (*s0 != 0)
//  { .... }
// We're breaking this out into two separate steps
// to make the conversion to assembly language a
// little easier.
//
// Also -- the variable names match up with names
// of registers.  In C, you would normally use something
// else for names, so that the code is a little
// easier to read.
