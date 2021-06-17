append([],B,B). % clause 1
append([D|A],B,[D|C]):-append(A,B,C).
% clause 2
