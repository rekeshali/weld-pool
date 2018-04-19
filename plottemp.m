MM = 100;
MM = MM-1;
a = 0;
b = 1;
dx = 1/MM;
% k = 20;
M = MM*(b-a);

[x,y] = meshgrid(a:dx:b);
% [xq, yq] = meshgrid(a:dx/k:b);
%% LETS MAKE A MOVIE
fid = fopen("temp.o");
i = 1;
while ~feof(fid)
    %% READ CURRENT TEMP
    T = fgetmat(fid);
    %% PLOT TEMPERATURE 
    surf(x,y,T); 
    colorbar;
    caxis([0 1]);
    colormap jet
    shading interp;
    view(0,90);
    if i == 1
        pause(1);
    end
    pause(0.4);
    i = i + 1;
end
fclose(fid);