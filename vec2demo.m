function vec2demo(X,Y)                   %7/14/02; last updated 7/3/03
%VEC2DEMO  A graphical demonstration of vector operations for
%          two dimensional real vectors.
%
%          Select vectors u = [x1 y1] and v = [x2 y2].
%          They will be displayed graphically along with their sum,
%          difference, and a scalar multiple.
%
%          Use in the form:  ==>  vec2demo(u,v)  <==
%                       or   ==>  vec2demo       <==
%          In the latter case you will be prompted for input.
%
%
%  By: David R. Hill, MATH Department, Temple University
%      Philadelphia, Pa., 19122        Email: hill@math.temple.edu

%NOTE: arrowh draws tips backwards for downward vertical vectors
%          Requires routine arrowh.m from D. Hill.
%      drawing tips commented out 7/03/03
%
name=['     Original vectors u and v    ';
      '        SUM:  u + v              ';
      '     DIFFERENCE: u - v           ';
      'Scalar Multiple:  (-2u) & (1/2)v '];
head='                    Vector Demonstration in the Plane';
s0=' ';
s1='Enter vector u  ==>  ';
s2='Enter vector v  ==>  ';
s3='There are four graphs generated in this routine.';
s4=['           << OPTIONS >>              ';
    '                                      ';
    '1. Show all graphs on the same screen.';
    '                                      ';
    '2. Show graphs on individual screens. ';
    '                                      ';
    '0. QUIT!                              ']; 
s5='   Enter your choice  ==>  ';      
s6='Routine VEC2DEMO is over!';
s7='Invalid choice; select 0, 1, or 2. TRY AGAIN!';
s8='Press ENTER to return to command screen.';
s9=['           << OPTIONS >>              ';
    '                                      ';
    '1. Use a built in demo with vectors   ';
    '   u = [8 1] and v = [2 7]            ';
    '                                      ';
    '2. Enter your pair of vectors u and v.';
    '                                      ';
    '0. QUIT!                              ']; 
er='Error: vectors must have two entries. Routine terminated.';

%INPUT routine

if nargin<2
   goodch='N';
   while goodch=='N'
      clc,disp(head),disp(s0),disp(s0)
      disp(s9),disp(s0),ch=input(s5);
      if ch==1
         X=[8 1];Y=[2 7];goodch='Y';
      end
      if ch==2
         X=input(s1);disp(s0),disp(s0)
         Y=input(s2);disp(s0),disp(s0)
         goodch='Y';
      end
      if ch==0,clc,disp(s6),return,end
      if ch~=1 & ch~=2
         disp(s7),disp(s0),disp(s8),pause
      end
   end
end   
[xm xn]=size(X);[ym yn]=size(Y);
if xm*xn~=2 | ym*yn~=2
   disp(er)
   return
end

if isreal(X)==0 | isreal(Y)==0 | sum(isnan(X))~=0 |sum(isnan(Y))~=0 | sum(isinf(X))~=0 | sum(isinf(Y))~=0
    disp('ERROR: vectors must have all real entries. Routine terminated.')
    return
end   
X=reshape(X,1,2);Y=reshape(Y,1,2);
validch='N';
while(validch=='N')
   clc,disp(head),disp(s0),disp(s0)
   disp(s3),disp(s0)
   disp(s4),disp(s0)
   ch=input(s5);
   if ch==0,clc,disp(s6),return,end
   if ch==1 | ch==2
      validch='Y';
   else
      disp(s7),disp(s0),disp(s8),pause
   end
end

%set window
%GRAPHICS WINDOW
figure('units','normal','position',[0 0 1 .95],'color','white');

%START graphs

V=[X;Y;X+Y;X-Y;-2*X;.5*Y];
T1=min(V(:,1))-1;T2=max(V(:,1))+1;T3=min(V(:,2))-1;T4=max(V(:,2))+1;
T=[T1 T2 T3 T4]; %determining graphics box
plt=[221 222 223 224];

if ch==1
   %figure
   for j=1:4
      subplot(plt(j)),axis(T),hold on
      title(name(j,:),'erasemode','none','fontweight','bold')
   end
end

%ORIGINALS
if ch==1
   subplot(plt(1))
else
   figure('units','normal','position',[0 0 1 .95],'color','white');
   axis(T),hold on
   title(name(1,:),'erasemode','none','fontweight','bold')
end
%[xx,yy]=arrowh([0 0],X);
%plot(xx,yy,'-b','erasemode','none','linewidth',2)
plot([0 X(1)],[0 X(2)],'-b','erasemode','none','linewidth',2)
%[xx,yy]=arrowh([0 0],Y);
%plot(xx,yy,'-r','erasemode','none','linewidth',2)
plot([0 Y(1)],[0 Y(2)],'-r','erasemode','none','linewidth',2)
grid on
gca;plot(Xlim,[0 0],'-k',[0 0],Ylim,'-k','linewidth',2);
pause(3)
text(X(1)/2,X(2)/2,'u','erasemode','none','color','magenta',...
     'fontsize',14,'fontweight','bold')
pause(1)
text(Y(1)/2,Y(2)/2,'v','erasemode','none','color','magenta',...
     'fontsize',14,'fontweight','bold')
%if ch==2,text(T(1),T(3),s8,'erasemode','none'),pause,else,pause(5),end
hold off
if ch==2
   text(T(1),T(3)+1,'Press ENTER to Continue.','erasemode','none','fontweight','bold')
   pause
else
   pause(3)
end

%SUM
if ch==1
   subplot(plt(2))
else
   figure('units','normal','position',[0 0 1 .95],'color','white');
   axis(T),hold on
   title(name(2,:),'erasemode','none','fontweight','bold')
end
%[xx,yy]=arrowh([0 0],X);
grid on
gca;plot(Xlim,[0 0],'-k',[0 0],Ylim,'-k','linewidth',2);
%plot(xx,yy,'-b','erasemode','none','linewidth',2)
plot([0 X(1)],[0 X(2)],'-b','erasemode','none','linewidth',2)
pause(1)
text(X(1)/2,X(2)/2,'u','erasemode','none','color','magenta',...
     'fontsize',14,'fontweight','bold')
%[xx,yy]=arrowh([0 0],Y);
%plot(xx,yy,'-r','erasemode','none','linewidth',2)
plot([0 Y(1)],[0 Y(2)],'-r','erasemode','none','linewidth',2)
pause(1)
Z=X+Y;
plot([X(1) Z(1)],[X(2) Z(2)],':r','erasemode','none','linewidth',2)
pause(2)
text((X(1)+Z(1))/2,(X(2)+Z(2))/2,'v','erasemode','none','color','magenta',...
     'fontsize',14,'fontweight','bold')
%plot([Y(1) Z(1)],[Y(2) Z(2)],':b','erasemode','none','linewidth',2)
pause(2)
plot([0 Z(1)],[0 Z(2)],'--g','erasemode','none','linewidth',2)
pause(1)
text(Z(1)/2,Z(2)/2,'u+v','erasemode','none','color','green',...
     'fontsize',14,'fontweight','bold')
%if ch==2,xlabel(s8,'erasemode','none'),pause,else,pause(5),end
hold off
if ch==2
   text(T(1),T(3)+1,'Press ENTER to Continue.','fontweight','bold','erasemode','none')
   pause
else
   pause(3)
end

%DIFERENCE
if ch==1
   subplot(plt(3))
else
   figure('units','normal','position',[0 0 1 .95],'color','white');
   axis(T),hold on
   title(name(3,:),'erasemode','none','fontweight','bold')
end
%[xx,yy]=arrowh([0 0],X);
grid on
gca;plot(Xlim,[0 0],'-k',[0 0],Ylim,'-k','linewidth',2);
%plot(xx,yy,'-b','erasemode','none','linewidth',2)
plot([0 X(1)],[0 X(2)],'-b','erasemode','none','linewidth',2)
text(X(1)/2,X(2)/2,'u','erasemode','none','color','magenta',...
     'fontsize',14,'fontweight','bold')
%[xx,yy]=arrowh([0 0],Y);
%plot(xx,yy,'-r','erasemode','none','linewidth',2)
plot([0 Y(1)],[0 Y(2)],'-r','erasemode','none','linewidth',2)
text(Y(1)/2,Y(2)/2,'v','erasemode','none','color','magenta',...
     'fontsize',14,'fontweight','bold')
pause(1)
%new code to put in natural difference from origin 10/3/97
%
D=X-Y;
plot([X(1) D(1)],[X(2) D(2)],':r','erasemode','none','linewidth',2)
text((X(1)+D(1))/2,(X(2)+D(2))/2,'-v','erasemode','none','color','magenta',...
     'fontsize',14,'fontweight','bold')
pause(2)
plot([0 D(1)],[0 D(2)],'--g','erasemode','none','linewidth',2)
text(D(1)/2,D(2)/2,'u-v','erasemode','none','color','green',...
     'fontsize',14,'fontweight','bold')
pause(2)
messd=text(T(1),T(3)+1,'Press ENTER to see the standard parallelogram.','fontweight','bold');
pause
delete(messd)
%%%%%%%%%%%%%%%%%%%%%%%%%
plot([Y(1) Z(1)],[Y(2) Z(2)],'-y','erasemode','none','linewidth',2)
pause(2)
text((Y(1)+Z(1))/2,(Y(2)+Z(2))/2,'u','erasemode','none','color','magenta',...
     'fontsize',14,'fontweight','bold')
plot([X(1) Z(1)],[X(2) Z(2)],':y','erasemode','none','linewidth',2)
pause(2)
text((X(1)+Z(1))/2,(X(2)+Z(2))/2,'-v','erasemode','none','color','magenta',...
     'fontsize',14,'fontweight','bold')
plot([Y(1) X(1)],[Y(2) X(2)],'--g','erasemode','none','linewidth',2)
pause(2)
text(Z(1)/2,Z(2)/2,'u-v','erasemode','none','color','green',...
     'fontsize',14,'fontweight','bold')
%if ch==2,xlabel(s8,'erasemode','none'),pause,else,pause(5),end
hold off
if ch==2
   text(T(1),T(3)+1,'Press ENTER to Continue.','fontweight','bold','erasemode','none')
   pause
else
   pause(3)
end

%MULTIPLES
if ch==1
   subplot(plt(4))
else
   figure('units','normal','position',[0 0 1 .95],'color','white');
   axis(T),hold on
   title(name(4,:),'erasemode','none','fontweight','bold')
end
%[xx,yy]=arrowh([0 0],-2*X);
grid on
gca;plot(Xlim,[0 0],'-k',[0 0],Ylim,'-k','linewidth',2);
%plot(xx,yy,'-b','erasemode','none','linewidth',2)
plot([0 -2*X(1)],[0 -2*X(2)],'-b','erasemode','none','linewidth',2)
text(-X(1),-X(2),'-2u','erasemode','none','color','magenta',...
     'fontsize',14,'fontweight','bold')
pause(1)
%[xx,yy]=arrowh([0 0],(1/2)*Y);
%plot(xx,yy,'-r','erasemode','none','linewidth',2)
plot([0 (1/2)*Y(1)],[0 (1/2)*Y(2)],'-r','erasemode','none','linewidth',2)
text(.25*Y(1),.25*Y(2),'(1/2)v','erasemode','none','color','magenta',...
     'fontsize',14,'fontweight','bold')
pause(1)
xlabel(s8,'erasemode','none','fontweight','bold')
hold off
if ch==1,subplot,end
clc,disp(s6),return



