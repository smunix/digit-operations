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

smunix@smunix:~/Programming/haskell/digit-operations|(master✔)
⇒  digit-operations-exe   
> 100
1x2x3+4+5+6+7+8x9=100
1+2+3+4+5+6+7+8x9=100
1x2x3x4+5+6+7x8+9=100
12+3x4+5+6+7x8+9=100
1+2x3+4+5+67+8+9=100
1x2+34+5+6x7+8+9=100
12+34+5x6+7+8+9=100

> 200
1+23+4x5+67+89=200
1+23+45+6x7+89=200
1+23x4+5+6+7+89=200
12+3+4x5x6+7x8+9=200

> 300
1x2x3+45x6+7+8+9=300
1+2+3+45x6+7+8+9=300
1x2x3x45+6+7+8+9=300

> 500
12+3+4+56x7+89=500
1+23x4+5x67+8x9=500
1x2+34+56x7+8x9=500
> 600

12x3+4+56+7x8x9=600
1+23x4x5+67+8x9=600
> 700

> 1250
1x2+3+456+789=1250
123x4+56+78x9=1250
