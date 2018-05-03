function gifmaker(gifname,figlabel,i)
    % Makes a gif, duh
    frame = getframe(figlabel); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
    % Write to the GIF File 
    if i == 1 
      imwrite(imind,cm,gifname,'gif', 'Loopcount',inf, 'WriteMode','overwrite'); 
    else 
      imwrite(imind,cm,gifname,'gif','WriteMode','append'); 
    end 
end