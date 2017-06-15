function y = forsub(A,b)                  %last updated 2/5/98
%FORSUB    Perform forward substitution on a lower triangular
%          system Ax = b.  If A is not square, lower
%          triangular and nonsingular an error message is
%          displayed. In case of an error the solution returned is
%          all zeros.
%
%   Use in the form  ==> forsub(A,b)  <==
%   
%     By: David R. Hill, MATH DEPT, Temple University,
%         Philadelphia, Pa. 19122   Email: hill@math.temple.edu
[mA,nA]=size(A);
if (mA==nA) & (nA==length(b)) & (sum(sum(abs(triu(A,1))))==0) ...
    & (abs(prod(diag(A))) > eps)
    n=length(b);
    x=zeros(n,1);
    x(1)=b(1)/A(1,1);
    for j=2:n
        x(j)=b(j);
        for i = 1:j-1
            x(j)=x(j)-A(j,i)*x(i);
        end
        x(j)=x(j)/A(j,j);
    end
    y=x;
else
    disp('Error in function forsub.')
    disp('Coefficient matrix not square,')
    disp('not lower triangular, or is singular.')
    y=[];
end
                   
                         



