function circimages(A)                %5/31/02; lastupdated 7/3/03
%circimages  A demonstration of the images of the unit circle
%            when mapped by a 2 by 2 real matrix A with real eigenvalues.
%
%            Use in the form ==> circimages(A)  <==
%
%            The output is a set of 6 graphs for A^k*(unit circle)
%            for k = 1,2, ..., 6. The displays are scaled so that
%            all the images are in the same size graphics box.
%
%
%  By: David R. Hill, Math. Dept., Temple University,
%      Philadelphia, Pa.  19122   Email:  hill@math.temple.edu

[m,n]=size(A);
if m~=2 | n~=2
    disp('ERROR: matrix must be 2 by 2. Routine terminated.')
    return
end
if isreal(A)==0
    disp('ERROR: matrix must have all real entries. Routine terminated.')
    return
end   
[vec val]=eig(A);
if isreal(val)==0
    disp('ERROR: matrix must have real eigenvalues. Routine terminated.')
    return
end
setwin='figure,set(gcf,''units'',''normal'',''color'',''white''),';
setwin=[setwin 'set(gcf,''position'',[0 0 1 1]);'];
        %setting graphics window to full size
ax=[-1.2 1.2 -1.2 1.2];
setax= 'axis(ax);axis(axis),axis(''square'')';        
t=0:.1:2.1*pi;
m=length(t);
x=cos(t);y=sin(t);
eval(setwin)
val=diag(val);[Y,I]=max(val);evec=vec(:,I);
dat=[x;y];
w=[231:236];%subplot numbers
for jj=1:6
    u=A^(jj-1)*dat;
    for ii=1:m
         nc(ii)=norm(u(:,ii));
    end
    maxnc=max(nc);
    u=u./maxnc;  %scaling to keep inside unit circle
    evecplt=A^(jj-1)*evec;
    subplot(w(jj))
    plot(u(1,:),u(2,:),'-k','linewidth',2,'erasemode','none'),drawnow
    hold on
    if jj>1
       plot([0 evecplt(1)],[0 evecplt(2)],':r','linewidth',2,'erasemode','none'),drawnow
    end
    eval(setax)
    addaxes
    if jj==1
        title('Unit Circle');
    else
        title(['A^' num2str(jj-1) ' times Unit Circle']);
    end
    pause(3)
end
xlabel('Press ENTER to continue.')
