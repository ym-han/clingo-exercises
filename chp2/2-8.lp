% Exercise2.11

%% a) want p(0,1) p(1,-1) p(2,1) p(3,-1) p(4,1)

p(Idx, Idx\2 * (-1)) :- Idx = 0..4.

%% b) want p(1,1)
%%         p(2,1) p(2,2)
%%         p(3,1) p(3,2) p(3,3)
%%         p(4,1) p(4,2) p(4,3) p(4,4)

p(I, 1..I) :- I = 0..4.


% Exercise 2.13 (a) How would you define the predicate sibling/2 in terms of parent/2? (b) If you run CLINGO on your definition, combined with facts (2.2), what stable model do you think it will produce?



%% Exercise2.14 Assuming that the atom enrolled(S,C) expresses that student S is enrolled in class C, how would you define the set enrolled/1 of all students who are enrolled in at least one class?

enrolled(X) :- enrolled(X, C), isClass(C).

%% Exericse 2.15
% encoding
same_city(X, Y) :- lives_in(X, C), lives_in(Y, C), X != Y.

% facts
lives_in(dana, tokyo; tommy, tokyo; ym, singapore; nick, seattle).


%% Exercise 2.16

older(X, Y) :- age(X, Age_x), age(Y, Age_y), Age_x > Age_y. 
% Note: we need to make sure the ages are variables.

age(alice, 0; bob, 1; nick, 22; y, 35).

%% Exercise 2.24. Rewrite the last rule of 
% p(a; b).
% {q(X, Y) : p(X), p(Y)} = 1.
% without using local vars.

p(a; b).
{q(a, a); q(a, b); q(b, a); q(b, b)} = 1.

% How many stable models does this have?
% 1 {p(1..3)} 2.
% :- p(1), not p(2).

% Ex. 2.27. Replace the cardinality bound in this choice rule with a constraint
% {p(a); q(b)}.

{p(a); q(b)}.
:- not p(a), not q(b).

% Ex. 2.29 What models for p(1,1). q(X) :- X = 1..2, not p(X,_).
% Just one model: q(2) p(1,1)
% since it removes everything of the form p(X, Y), for X in 1..2 and for any Y.