function atomplot(pos)
%The function atomsplot plots spheres at the 3dimensional coordinates specified by the vectors
%x,y and z in pos.  
%R - radii of the atoms  
%T - atom type an integer from 1 to the number of types of atoms

R=0.3;
[Xs,Ys,Zs]=sphere(25);     %Creates spheres of precision 25
Xs=Xs*R;                   %creates the radii size of the spheres 
Ys=Ys*R;
Zs=Zs*R;

clf reset
hold on
ball=zeros(1,size(pos,1));

for t=1:size(pos,1)
    ball(t)=surf(Xs+pos(t,1),Ys+pos(t,2),Zs+pos(t,3));   %plots the balls 

    set(ball(t),'facecolor','r',...
        'edgecolor','none','facelighting','phong' ); 
    %sets colors and effects for the ball plotting

    for t2=(t+1):size(pos,1)
        r=sqrt(sum((pos(t,:)-pos(t2,:)).^2));
        if r>0.85 && r<1.15
            line([pos(t,1) pos(t2,1)],[pos(t,2) pos(t2,2)],...
                [pos(t,3) pos(t2,3)],'Color',[0 0 0],'LineWidth',4);
        elseif r<0.05
            error('Atoms overlapping!');
        end
    end
end
    
axis equal          %keeps from distorting the relations of the axis
camlight right      

hold off
end
