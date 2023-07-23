% There are n tables in the room, with m chairs around each table.
% Choose a table for each of m*n guests so that
% guests who like each other sit at the same table, and
% guests who don't like each other sit at different tables.

% input: positive integers m, n; 
%        set like/2 of pairs of guests who like each other; 
%        set dislike/2 of pairs of guests who dislike each other.


% sample input and directives for debugging 
% #const n=2.
% #const m=3.
% like(1,2; 3,4).
% dislike(2,3; 1,3).
% #show at_same/2.
% #show like/2.
% #show dislike/2.


% at(G,T) means that guest G is assigned table T.

{at(1..m*n, T)} = m :- T = 1..n.
% achieved: for each table, a group of m guests is selected.

G1 = G2 :- at(G1, T), at(G2, T).
% achieved: the groups are pairwise disjoint.

%% Note to self: at this point, we have ( m*n choose n ) models; i.e., # of models = # of subsets of size m of a set of m*n ppl
%% This is 2 * the number of ways to break the m*n ppl into n groups of m.

at_same(G1, G2) :- at(G1, T1), at(G2, T1), T1 = T2.

:- like(G1, G2), at(G1, T1), at(G2, T2), not at_same(G1, G2).
% achieved: guests who like each other sit at the same table.

:- dislike(G1, G2), at(G1, T1), at(G2, T2), at_same(G1, G2).
% achieved: guests who don’t like each other sit at different
% tables.

#show at/2.