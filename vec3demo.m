function vec3demo(X,Y)                 %7/14/02; last updated 7/3/03
%VEC3DEMO   Display a pair of real three dimensional vectors, their
%           sum, diffence and scalar multiples.
%
%         The input vectors u and v are displayed in a 3-dimensional
%         perspective along with their sum, differnce and selected
%         scalar multiples. For visualization purposes a set of
%         coordinate 3-D axes are shown.
%
%         Use in the form:  ==>  vec3demo(u,v)  <==
%          or in the form:  ==>  vec3demo       <== to choose a demo
%                                                   or be prompted 
%                                                   for input                               
%
%  By: David R. Hill, MATH Department, Temple University
%      Philadelphia, Pa., 19122        Email: hill@math.temple.edu


name=['     Original vectors u and v    ';
      '        SUM:  u + v              ';
      '     DIFFERENCE: u - v           ';
      'Scalar Multiple:  (-2u) & (1/2)v '];
head='                    Vector Demonstration in 3-Space';
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
s6='Routine VEC3DEMO is over!';
s7='Invalid choice; select 0, 1, or 2. TRY AGAIN!';
s8='Press ENTER to continue.';
s9=['           << OPTIONS >>              ';
    '                                      ';
    '1. Use a built in demo with vectors   ';
    '   u = [8 2 9] and v = [5 -7 -15]     ';
    '                                      ';
    '2.Enter your pair of vectors u and v. ';
    '                                      ';
    '0. QUIT!                              '];  
warnmess=['WARNING: In some cases you may need to rotate';
          'the coordinate system in order to see the    ';
          'the vectors in their proper relationship.    '];
rotmess=['Select the figure number you want to view from    ';
         'the list at the bottom; click its number. Once it ';
         'is visible proceed as follows.                    ';
         '                                                  ';
         'To rotate the coordinate system click on Tools,   ';
         'then click on Rotate 3D. Next click in the figure ';
         'and drag the mouse to reorient the system.        '];
er='Error: vectors must have three entries. Routine terminated.';


%INPUT routine

if nargin<2
   goodch='N';
   while goodch=='N'
      clc,disp(head),disp(s0),disp(s0)
      disp(s9),disp(s0),ch=input(s5);
      if ch==1
         X=[8 2 9];Y=[5 -7 -15];goodch='Y';
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
if xm*xn~=3 | ym*yn~=3
   disp(er)
   return
end
if isreal(X)==0 | isreal(Y)==0 | sum(isnan(X))~=0 |sum(isnan(Y))~=0 | sum(isinf(X))~=0 | sum(isinf(Y))~=0
    disp('ERROR: vectors must have all real entries. Routine terminated.')
    return
end   
X=reshape(X,1,3);Y=reshape(Y,1,3);
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
T1=min(V(:,1))-1;T2=max(V(:,1))+1;
T3=min(V(:,2))-1;T4=max(V(:,2))+1;
T5=min(V(:,3))-1;T6=max(V(:,3))+1;
T=[T1 T2 T3 T4 T5 T6]; %determining graphics box
%plt=[221 222 223 224];

if ch==1
   %figure
   sub1=subplot('position',[.1 .6 .25 .25]);
   sub2=subplot('position',[.6 .6 .25 .25]);
   sub3=subplot('position',[.1 .25 .25 .25]);
   sub4=subplot('position',[.6 .25 .25 .25]);
   for j=1:4
      if j==1,subplot(sub1);end
      if j==2,subplot(sub2);end
      if j==3,subplot(sub3);end
      if j==4,subplot(sub4);end
      axis(T),hold on
      title(name(j,:),'erasemode','none','fontweight','bold')
   end
end

%ORIGINALS
if ch==1
   subplot(sub1)
else
   figure('units','normal','position',[0 0 1 .95],'color','white');
   axis(T),hold on
   title(name(1,:),'erasemode','none','fontweight','bold')
end

plot3([0 X(1)],[0 X(2)],[0 X(3)],'-b','erasemode','none','linewidth',2)
hold on
plot3([0 Y(1)],[0 Y(2)],[0 Y(3)],'-r','erasemode','none','linewidth',2)
grid on
gca;
plot3(Xlim,[0 0],[0 0],'-k',[0 0],Ylim,[0 0],'-k',[0 0],[0 0],Zlim,'-k','linewidth',2,'erasemode','none');
pause(3)
text(X(1)/2,X(2)/2,X(3)/2,'u','erasemode','none','color','magenta',...
     'fontsize',14,'fontweight','bold')
pause(1)
text(Y(1)/2,Y(2)/2,Y(3)/2,'v','erasemode','none','color','magenta',...
     'fontsize',14,'fontweight','bold')
hold off
if ch==2
   xlabel('Press ENTER to Continue.','erasemode','none','fontweight','bold')
   pause
else
   pause(3)
end

%SUM
if ch==1
   subplot(sub2)
else
   figure('units','normal','position',[0 0 1 .95],'color','white');
   axis(T),hold on
   title(name(2,:),'erasemode','none','fontweight','bold')
end
plot3([0 X(1)],[0 X(2)],[0 X(3)],'-b','erasemode','none','linewidth',2)
hold on
plot3([0 Y(1)],[0 Y(2)],[0 Y(3)],'-r','erasemode','none','linewidth',2)
grid on
gca;
plot3(Xlim,[0 0],[0 0],'-k',[0 0],Ylim,[0 0],'-k',[0 0],[0 0],Zlim,'-k','linewidth',2,'erasemode','none');
pause(3)
text(X(1)/2,X(2)/2,X(3)/2,'u','erasemode','none','color','magenta',...
     'fontsize',14,'fontweight','bold')
pause(1)
text(Y(1)/2,Y(2)/2,Y(3)/2,'v','erasemode','none','color','magenta',...
     'fontsize',14,'fontweight','bold')
pause(1)
Z=X+Y;
plot3([X(1) Z(1)],[X(2) Z(2)],[X(3) Z(3)],':r','erasemode','none','linewidth',2)
pause(2)
text((X(1)+Z(1))/2,(X(2)+Z(2))/2,(X(3)+Z(3))/2,'v','erasemode','none','color','magenta',...
     'fontsize',14,'fontweight','bold')
pause(2)
plot3([0 Z(1)],[0 Z(2)],[0 Z(3)],'--g','erasemode','none','linewidth',2)
pause(1)
text(Z(1)/2,Z(2)/2,Z(3)/2,'u+v','erasemode','none','color','green',...
     'fontsize',14,'fontweight','bold')
hold off
if ch==2
   xlabel('Press ENTER to Continue.','fontweight','bold','erasemode','none')
   pause
else
   pause(3)
end

%DIFERENCE
if ch==1
   subplot(sub3)
else
   figure('units','normal','position',[0 0 1 .95],'color','white');
   axis(T),hold on
   title(name(3,:),'erasemode','none','fontweight','bold')
end
plot3([0 X(1)],[0 X(2)],[0 X(3)],'-b','erasemode','none','linewidth',2)
hold on
plot3([0 Y(1)],[0 Y(2)],[0 Y(3)],'-r','erasemode','none','linewidth',2)
grid on
gca;
plot3(Xlim,[0 0],[0 0],'-k',[0 0],Ylim,[0 0],'-k',[0 0],[0 0],Zlim,'-k','linewidth',2,'erasemode','none');
pause(3)
text(X(1)/2,X(2)/2,X(3)/2,'u','erasemode','none','color','magenta',...
     'fontsize',14,'fontweight','bold')
pause(1)
text(Y(1)/2,Y(2)/2,Y(3)/2,'v','erasemode','none','color','magenta',...
     'fontsize',14,'fontweight','bold')
pause(1)
%new code to put in natural difference from origin 10/3/97
%
D=X-Y;
plot3([X(1) D(1)],[X(2) D(2)],[X(3) D(3)],':r','erasemode','none','linewidth',2)
text((X(1)+D(1))/2,(X(2)+D(2))/2,(X(3)+D(3))/2,'-v','erasemode','none','color','magenta',...
     'fontsize',14,'fontweight','bold')
pause(2)
plot3([0 D(1)],[0 D(2)],[0 D(3)],'--g','erasemode','none','linewidth',2)
text(D(1)/2,D(2)/2,D(3)/2,'u-v','erasemode','none','color','green',...
     'fontsize',14,'fontweight','bold')
pause(2)
messd=xlabel('Press ENTER to see the standard parallelogram.','fontweight','bold');
pause
delete(messd)
%%%%%%%%%%%%%%%%%%%%%%%%%
plot3([Y(1) Z(1)],[Y(2) Z(2)],[Y(3) Z(3)],'-y','erasemode','none','linewidth',2)
pause(2)
text((Y(1)+Z(1))/2,(Y(2)+Z(2))/2,(Y(3)+Z(3))/2,'u','erasemode','none','color','magenta',...
     'fontsize',14,'fontweight','bold')
plot3([X(1) Z(1)],[X(2) Z(2)],[X(3) Z(3)],':y','erasemode','none','linewidth',2)
pause(2)
text((X(1)+Z(1))/2,(X(2)+Z(2))/2,(X(3)+Z(3))/2,'-v','erasemode','none','color','magenta',...
     'fontsize',14,'fontweight','bold')
plot3([Y(1) X(1)],[Y(2) X(2)],[Y(3) X(3)],'--g','erasemode','none','linewidth',2)
pause(2)
text(Z(1)/2,Z(2)/2,Z(3)/2,'u-v','erasemode','none','color','green',...
     'fontsize',14,'fontweight','bold')
hold off
if ch==2
   xlabel('Press ENTER to Continue.','fontweight','bold','erasemode','none')
   pause
else
   pause(3)
end

%MULTIPLES
if ch==1
   subplot(sub4)
else
   figure('units','normal','position',[0 0 1 .95],'color','white');
   axis(T),hold on
   title(name(4,:),'erasemode','none','fontweight','bold')
end
plot3([0 -2*X(1)],[0 -2*X(2)],[ 0 -2*X(3)],'-b','erasemode','none','linewidth',2)
hold on
plot3([0 .5*Y(1)],[0 .5*Y(2)],[0 .5*Y(3)],'-r','erasemode','none','linewidth',2)
grid on
gca;
plot3(Xlim,[0 0],[0 0],'-k',[0 0],Ylim,[0 0],'-k',[0 0],[0 0],Zlim,'-k','linewidth',2,'erasemode','none');
pause(3)
text(-X(1),-X(2),-X(3),'-2u','erasemode','none','color','magenta',...
     'fontsize',14,'fontweight','bold')
pause(1)
text(.25*Y(1),.25*Y(2),.25*Y(3),'(1/2)v','erasemode','none','color','magenta',...
     'fontsize',14,'fontweight','bold')
pause(1)
if ch==2,xlabel('Press ENTER to Return to the command screen.','erasemode','none','fontweight','bold');end
hold off

if ch==1
   %WARNING MESSAGE
   warnsub=subplot('position',[.02 .1 .2 .1]);axis('off');
   text(0,1,'WARNING: In some cases you may need to rotate','color','black','fontsize',12,'fontweight','bold');
   text(0,.7,'the coordinate system in order to see the','color','black','fontsize',12,'fontweight','bold');
   text(0,.4,'the vectors in their proper relationship. =====>','color','black','fontsize',12,'fontweight','bold');
   %rotation message
   messsub=subplot('position',[.5 .1 .2 .1]);axis('off');
   text(0,1,'To rotate the coordinate system click on Tools,','color','red','fontsize',12,'fontweight','bold');
   text(0,.7,'then click on Rotate 3D. Next click in the figure','color','red','fontsize',12,'fontweight','bold');
   text(0,.4,'and drag the mouse to reorient the system.','color','red','fontsize',12,'fontweight','bold');
   text(0,0,'PRESS ENTER to return to the command screen.','fontsize',12,'fontweight','bold');
end

clc
if ch==2,disp(warnmess),disp(rotmess),end
disp(s6)
return



