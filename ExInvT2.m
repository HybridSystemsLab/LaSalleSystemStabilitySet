%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Simulation of Examples from TOOLS FOR THE STUDY OF STABILITY AND CONVERGENCE IN SET
% DYNAMICAL SYSTEMS WITH APPLICATIONS TO FEEDBACK CONTROL
% Example: 5
% Nathalie Risso. nrisso@email.arizona.edu
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
X0=newset2([0,1],[0,1],0.01);
J=10;
% function X=myG(X0,J)
[f,c]=size(X0);
X=zeros(f,2,J);
% include initial value
X(:,:,1)=X0;
a=1;
close all;
for j=1:J-1
    for i_f=1:f
    X(i_f,1,j+1)=a*X(i_f,2,j)./(1+(X(i_f,1,j).^2));
    X(i_f,2,j+1)=a*X(i_f,1,j)./(1+(X(i_f,2,j).^2));
    end
    end
% plots
figure(1)

for i=1:J-1
   plot3(max(X(:,1,i)),max(X(:,2,i)),0*X(:,2,i)+i-1,'b','LineWidth',2); 
   hold on;
   xlabel('$x_1$', 'Interpreter','latex');ylabel('$x_2$', 'Interpreter','latex');zlabel('j', 'Interpreter','latex')
   grid on
end
figure(2)
for i=1:J
   plot(X(:,1,i),X(:,2,i),'LineWidth',3);  hold on;  grid on;
    xlabel('$x_1$','Interpreter','latex');ylabel('$x_2$','Interpreter','latex');
  end



