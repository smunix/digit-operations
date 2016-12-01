# digit-operations

Assuming you are given the list of all digits going from 1
to 9, 1 2 3 4 5 6 7 8 9. How many ways can we intercalate the operations
multiplication (*) and addition (+) between the digits in such a way that the
value of the arithmetic expression we get equals X (set X = 50 for example) ?
Note that the order of the digits 1 to 9 has to be ordered from smallest to the
greatest one.

Here’s one solution for X=50:   1+2+3*4+5+6+7+8+9 è 50

Here’s one solution for X=100: 1*2+34+5+6*7+8+9   è 100 [1]

As you can see in [1], 34 is also used as we didn’t put any
operator between 3 and 4. So note that not putting any operation between digits
is a valid choice as well.

I usually make up for combinations of this concept by asking
the candidate to write code to print out all the solutions, or just print how
many possible solutions we do have.

Next step is usually discussing the complexity of the
provided solution by the candidate, but it’s not very important I believe
(anyone knows why ?).

Happy coding !

=================
