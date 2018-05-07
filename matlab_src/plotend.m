function plotend(inputfile, outputfile, x, y, MM, Q, tend)
    [O, Omin, Omax, ~] = getoutput(outputfile, 1);
    Omax
    Omin
    picname = sprintf('%s_%s_%d_%d.png', inputfile, outputfile, MM, Q);
    Omax = 2377.85;
    Omin = 298;
    fig = figure;
    hold on
    set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.1, 0.1, .6, 0.8]);
    set(gcf,'color','w');
    
    surf(x,y,O);


    if(outputfile(1:4) == 'temp') % no colorbar if phase
        c = colorbar;
        ylc = ylabel(c, 'Temperature (K)', 'FontSize', 20, 'Rotation', 270);
        posy = get(ylc, 'Position');
        set(ylc, 'Position', posy + [2, (Omax-Omin)/2 - posy(2), 0]);
        caxis([Omin Omax]);
        ylabel('Y Dimension (cm)');
        xlabel('X Dimension (cm)');   
    elseif(outputfile(1:5) == 'phase')
        ylabel('Y Dimension (cm)');
        xlabel('X Dimension (cm)');
    end

    if(outputfile(1:4) == 'temp') % no colorbar if phase
        titstr = sprintf('%s, Temperature, MM = %.0f, Q = %.0fW, Time = %4.2fms', ...
            inputfile, MM , Q, 1000*tend);
        title(titstr);
    elseif(outputfile(1:5) == 'phase')
        titstr = sprintf('%s, Phase, MM = %.0f, Q = %.0fW, Time = %4.2fms', ...
            inputfile, MM , Q, 1000*tend);
        title(titstr)
    end

    set(gca, 'FontSize', 20);
    colormap jet
    shading interp;
    clear figure
    view(0,90);

    
    frame = getframe(fig); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
    imwrite(imind,cm,picname,'png', 'WriteMode','overwrite');
end