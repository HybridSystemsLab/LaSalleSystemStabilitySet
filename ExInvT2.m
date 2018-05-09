%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simulation of Examples from TOOLS FOR THE STUDY OF STABILITY AND CONVERGENCE IN SET
% DYNAMICAL SYSTEMS WITH APPLICATIONS TO FEEDBACK CONTROL
% Example: 5 Krasovski Theorem
% Nathalie Risso. nrisso@email.arizona.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
close all
n=100;
X0=newcset2d(0,0,1,n);
J=8;
a=2;
b=1;
[f,c]=size(X0);
X=zeros(f,2,J);
% include initial value
X(:,:,1)=X0;
for j=1:J-1
    for i_f=1:f
    X(i_f,1,j+1)=X(i_f,2,j)./(a*(1+(X(i_f,2,j).^2)));
    X(i_f,2,j+1)=X(i_f,1,j)./(b*(1+(X(i_f,2,j).^2)));
    end
end
% plots
az = -45;
el = 15;

figure(1)
for i=1:J
   plot3(X(:,1,i),X(:,2,i),0*X(:,2,i)+i-1,'LineWidth',2); 
   xlabel('$x_1$', 'Interpreter','latex');ylabel('$x_2$', 'Interpreter','latex');zlabel('j', 'Interpreter','latex')
   hold on;
   grid on
   view(az, el);
end
hZLabel1 = get(gca,'ZLabel');
set(hZLabel1,'rotation',0,'VerticalAlignment','middle')
hZLabelPos1 = get( hZLabel1 , 'position');
%hZLabelPos1(1) = ;
%set(  hZLabel1 , 'position' , hZLabelPos1);
print -depsc -tiff -r300 ExKras
% figure(2)
% for i=1:J
%    plot(X(:,1,i),X(:,2,i),'LineWidth',2); 
%    xlabel('$x_1$', 'Interpreter','latex');ylabel('$x_2$', 'Interpreter','latex');
%    hold on;
%    grid on
% end

% This function creates a circular 2D set 
% centered at (xc,yc)
% x = radius
% d = number of points in the vectors that generate the set
% resulting set will be d^2x2
function SE=newcset2d(xc,yc,r0,d)
% Vector containing values for radii
ra=linspace(0,r0,d);
% Vector containing values for angle
ang=linspace(0,2*pi,d);
[r, phi] = meshgrid(ra, ang);
X=[r(:),phi(:)];
X = xc+r.*cos(phi);
Y = yc+r.*sin(phi);
% 2D Set generated
SE = [X(:),Y(:)];
% Uncomment to see set plot
plot(Y,X,'b')
end


