function vecdemo                                     %last updated 9/30/97
%VECDEMO  A graphical demonstration of vector operations for
%          two and three dimensional vectors.
%
%          Select vectors u  and v.
%          They will be displayed graphically along with their sum,
%          difference, and a scalar multiple.
%
%       Use in the form  ==> vecdemo  <==
%
%       Requires vec2demo and vec3demo m-files.
%
%  By: David R. Hill, Mathematics Dept, Temple University
%      Philadelphia, Pa. 19122
s1=['A graphical demonstration of vector operations';
    'for two and three dimensional vectors.        ';
    '                                              ';
    'A pair of vectors u  and v will be displayed  ';
    'graphically along with their sum, difference, ';
    'and scalar multiples.                         '];
s0=' ';
sig='N';
while sig=='N'
   clc
   disp(s0),disp(s0)
   disp('              Demonstration of the Vector Operations')
   disp(s0),disp(s1),disp(s0),disp(s0)
   disp('   Select dimension 2 or 3 for this demonstration.')
   k=input('    ===>  dimension =  ');
   if k==2 | k==3
      sig='Y';
   else
      disp('Only 2-space or 3-space is available. -- Try again.')
      disp('Press ENTER.'),pause
   end
end
if k==2
   vec2demo
else
   vec3demo
end


