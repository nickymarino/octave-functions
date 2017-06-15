function crossdemo(u,v)                 %last updated 7/14/2002
%CROSSDEMO  Display a pair of three dimensional vectors and their
%           cross product.
%
%         The input vectors u and v are displayed in a 3-dimensional
%         perspective along with their cross product. For
%         visualization purposes a set of coordinate 3-D axes are
%         shown.
%
%         Use in the form:   ==>  crossdemo(u,v)  <==
%         
%         or in the form     ==>  crossdemo  <== to use a demo or
%                                                be prompted for input
%
%     By: David R. Hill, MATH DEPT, Temple University,
%         Philadelphia, Pa. 19122   Email: hill@math.temple.edu

head='                    CROSS PRODUCT Demonstration ';
s0=' ';
s1='Enter vector u  ==>  ';
s2='Enter vector v  ==>  ';
s5='   Enter your choice  ==>  ';      
s6='Routine CROSSDEMO is over!';
s7='Invalid choice; select 0, 1, or 2. TRY AGAIN!';
s8='Press ENTER to continue.';
s9=['           << OPTIONS >>              ';
    '                                      ';
    '1. Use a built in demo with vectors   ';
    '   u = [3 -2 1] and v = [1 2 -3]      ';
    '                                      ';
    '2. Enter your pair of vectors u and v.';
    '                                      ';
    '0. QUIT!                              '];  
er='Error in vec3demo: vectors not the same size';

%INPUT routine

if nargin<2
   goodch='N';
   while goodch=='N'
      clc,disp(head),disp(s0),disp(s0)
      disp(s9),disp(s0),ch=input(s5);
      if ch==1
         u=[3 -2 1];v=[1 2 -3];goodch='Y';
      end
      if ch==2
         u=input(s1);disp(s0),disp(s0)
         v=input(s2);disp(s0),disp(s0)
         goodch='Y';
      end
      if ch==0,clc,disp(s6),return,end
      if ch~=1 & ch~=2
         disp(s7),disp(s0),disp(s8),pause
      end
   end
end   
[xm xn]=size(u);[ym yn]=size(v);
if xm*xn~=3 | ym*yn~=3
   disp([blk blk blk er])
   return
end



%GRAPHICS WINDOW
figure('units','normal','position',[0 0 1 .95],'color','white');
%title
titlesub=subplot('position',[.01 .92 .6 .08]);
axis('off')
text(0,0,'CROSS PRODUCT DEMO', 'color','magenta','fontsize',24,'fontweight','bold')


%vanity
vansub=subplot('position',[.9 .06 .05 .03]);axis('off');
text(0,0,'by D.R.Hill','color','black','fontsize',10,'fontweight','bold',...
     'fontangle','oblique','erasemode','none')
 
%Calculations 
cruv=cross(u,v);
mat=[u' v' cruv'];
xsm=min(mat(1,:));xlrg=max(mat(1,:));
ysm=min(mat(2,:));ylrg=max(mat(2,:));
zsm=min(mat(3,:));zlrg=max(mat(3,:));

%the graph
grsub=subplot('position',[.2 .3 .5 .5]);
set(grsub,'visible','off')
plot3([0 u(1)],[0 u(2)],[0 u(3)],'w-','linewidth',2)
hold on
view(143,24)
plot3([0 v(1)],[0 v(2)],[0 v(3)],'w-','linewidth',2)
plot3([0 cruv(1)],[0 cruv(2)],[0 cruv(3)],'w-','linewidth',2)
subplot(grsub)
T=[xsm-1 xlrg+1 ysm-1 ylrg+1 zsm-1 zlrg+1];
axis(T);
gca;
xpt=Xlim;xmid=(xpt(2)-xpt(1))/2+xpt(1);
ypt=Ylim;ymid=(ypt(2)-ypt(1))/2+ypt(1);
zpt=Zlim;zmid=(zpt(2)-zpt(1))/2+zpt(1);
plot3(Xlim,[0 0],[0 0],'-k',[0 0],Ylim,[0 0],'-k',[0 0],[0 0],Zlim,'-k','linewidth',2,'erasemode','none');
text(xmid,0,0,'X-axis','fontweight','bold')
text(0,ymid,0,'Y-axis','fontweight','bold')
text(0,0,zmid,'Z-axis','fontweight','bold')
set(grsub,'visible','on')
plot3([0 u(1)],[0 u(2)],[0 u(3)],'r-','linewidth',2)
datasub=subplot('position',[.75 .4 .2 .2]);axis('off');
text(0,1,'The vectors:','color','black','fontsize',12,'fontweight','bold');
text(0,.7,['u = [' num2str(u(1)) '  ' num2str(u(2)) '  ' num2str(u(3)) ']'],'color','red','fontsize',12,'fontweight','bold');
pause(2)
subplot(grsub)
plot3([0 v(1)],[0 v(2)],[0 v(3)],'b-','linewidth',2)
subplot(datasub)
text(0,.5,['v = [' num2str(v(1)) '  ' num2str(v(2)) '  ' num2str(v(3)) ']'],'color','blue','fontsize',12,'fontweight','bold');
pause(2)
subplot(grsub)
plot3([0 cruv(1)],[0 cruv(2)],[0 cruv(3)],'g-','linewidth',2)
subplot(datasub)
text(0,.3,['u x v = [' num2str(cruv(1)) '  ' num2str(cruv(2)) '  ' num2str(cruv(3)) ']'],'color','green','fontsize',12,'fontweight','bold');
pause(3)
%fill the plane of u and v
subplot(grsub);
uplusv=u+v;
plot3([u(1) uplusv(1)],[u(2) uplusv(2)],[u(3) uplusv(3)],'b:')
pause(2)
plot3([v(1) uplusv(1)],[v(2) uplusv(2)],[v(3) uplusv(3)],'r:')
pause(2)
fill3([0 u(1) uplusv(1) v(1) 0],[0 u(2) uplusv(2) v(2) 0],[0 u(3) uplusv(3) v(3) 0],'y')
pause(4)

%WARNING MESSAGE
warnsub=subplot('position',[.02 .1 .2 .1]);axis('off');
text(0,1,'WARNING: In some cases you may need to rotate','color','black','fontsize',12,'fontweight','bold');
text(0,.7,'the coordinate system in order to see the','color','black','fontsize',12,'fontweight','bold');
text(0,.4,'the vectors in their proper relationship. =====>','color','black','fontsize',12,'fontweight','bold');


%end message
messsub=subplot('position',[.5 .1 .2 .1]);axis('off');
text(0,1,'To rotate the coordinate system click on Tools,','color','red','fontsize',12,'fontweight','bold');
text(0,.7,'then click on Rotate 3D. Next click in the figure','color','red','fontsize',12,'fontweight','bold');
text(0,.4,'and drag the mouse to reorient the system.','color','red','fontsize',12,'fontweight','bold');
text(0,0,'PRESS ENTER to return to the command screen.','fontsize',12,'fontweight','bold');








