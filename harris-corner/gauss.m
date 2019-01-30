% funzione per ka generazione del filtro gasussiano

function G=gauss(sigma)

offset = ceil(2.5*sigma);

% generazione filtro bidimensionale
[x,y] = meshgrid(-offset:offset, -offset:offset);
G = exp ( -((x.^2)+(y.^2)) / (2*(sigma^2)));

% normalizzazione del filtro
G = G / sum(sum(G));

end