function pos = Graphene(n, m, len)
%Graphene by Max Muss
Ch = [sqrt(3)*n + (sqrt(3)/2)*m, -1.5*m];
nx = Ch(1) / norm(Ch);
ny = Ch(2) / norm(Ch);

normalVector = [-ny, nx];
T = normalVector*len;

pMax = (ceil(Ch(1)+T(1)/sqrt(3)/2)).^2;
pMin = -pMax;
qMin = floor(Ch(2)/1.5);
qMax = ceil(T(2)/1.5);
[p,q] = meshgrid(pMin:pMax, qMin:qMax);

x = p.*sqrt(3)/2;
y = q.*1.5 - 0.5.*mod(p+q, 2);
s = x.*nx  + y.*ny;
t = x.*normalVector(1) + y.*normalVector(2);
V = (s >= 0) & (s <= norm(Ch)) & (t >= 0) & (t <= len);

pos =[x(V), y(V), zeros(size(x(V), 1), 1)];
atomplot(pos)

end