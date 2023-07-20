% Numbers from 1 to n that cannot be represented as the sum of 3 complete squares.
% input: positive integer n.


% ------------------------------------------------------
% achieved: three/1 is the set of numbers from {1,...,n} that
% can be represented as the sum of 3 squares.
three(N) :- N = 1..n, N = X**2 + Y**2 + Z**2, X = 0..N-1, Y = 0..N-1, Z = 0..N-1.

% ------------------------------------------------------
% achieved: more_than_three/1 is the set of numbers from
% {1,...,n} that can’t be represented as the sum
% of 3 squares.

more_than_three(N) :- N = 1..n, not three(N).


#show more_than_three/1.