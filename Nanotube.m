function pos = Nanotube(n, m, len)
%Nanotube by Max Muss
b = Graphene(n, m, len); 
Ch = [sqrt(3)*n + (sqrt(3)/2)*m, -1.5*m];
nx = Ch(1) / norm(Ch);
ny = Ch(2) / norm(Ch);

normalVector = [-ny, nx];
T = normalVector.*len;
circumference = norm(Ch);
r = circumference/(2*pi);

mouthDirection = nx.*b(:, 1) + ny.*b(:, 2);
tubeDirection = -ny.*b(:, 1) + nx.*b(:, 2);

xValues = r*cos(mouthDirection/r);
yValues = r*sin(mouthDirection/r);
zValues = tubeDirection;

pos = [xValues, yValues, zValues];
pos = round(pos, 5);
pos = unique(pos, 'rows', 'stable');

atomplot(pos)

end
