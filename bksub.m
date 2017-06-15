function y = bksub(A,b)                     %last updated 2/17/98
%BKSUB   Perform back substitution on upper triangular
%        system Ax = b.  If A is not square, upper
%        triangular and nonsingular an error message is
%        displayed. In case of an error the solution returned is
%        as an empty matrix.
%
%   Use in the form ---> bksub(A,b)  <---
%
%By: David R. Hill, MATH. Dept. , Temple University,
%    Philadelphia, Pa. 19122
%    Email: hill@math.temple.edu

if (size(A)==size(A') & all(all(A==triu(A))) & abs(prod(diag(A))) > eps)
    n=length(b);
    x=zeros(n,1);
    for j=n:-1:1
       x(j)=(b(j)-A(j,:)*x)/A(j,j);
    end
    y=x;
else
    disp('Error in function bksub.')
    disp('Coefficient matrix not square,')
    disp('not upper triangular, or has a zero pivot.')
    y=[];
    return
end
                                                                         
