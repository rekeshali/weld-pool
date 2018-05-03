MM = 100;
MM = MM-1;
a = 0;
b = 1;
dx = 1/MM;
% k = 20;
M = MM*(b-a);

[x,y] = meshgrid(a:dx:b);
outname = 'temp';
infile = 'debug';
gifname = sprintf('%s_%s.gif', outname, infile);
command = sprintf('rm %s', gifname);
system(command);
% [xq, yq] = meshgrid(a:dx/k:b);
%% LETS MAKE A MOVIE
filedir = sprintf("../outputs/%s.o",outname);
fid = fopen(filedir);
i = 1;
h = figure;
%axis tight manual % this ensures that getframe() returns a consistent size
while ~feof(fid)
    %% READ CURRENT TEMP
    T = fgetmat(fid);
    %% PLOT TEMPERATURE 
    surf(x,y,T); 
    c = colorbar;
    ylabel(c, 'Temperature (K)', 'FontSize', 16, 'Rotation', 270);
    caxis([0 2]);
    colormap jet
    shading interp;
    view(0,90);
    if i == 1
        pause(1);
    end
    pause(0.0004);
          % Capture the plot as an image 
      frame = getframe(h); 
      im = frame2im(frame); 
      [imind,cm] = rgb2ind(im,256); 
      % Write to the GIF File 
      if i == 1 
          imwrite(imind,cm,gifname,'gif', 'Loopcount',inf, 'WriteMode','overwrite'); 
      else 
          imwrite(imind,cm,gifname,'gif','WriteMode','append'); 
      end 
       i = i + 1;
end
fclose(fid);