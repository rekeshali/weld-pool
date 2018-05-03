function plotmain(inputfile,outputfile)
    % Example: plotmain('debug','temp') runs the temp output from the debug
    % input file
    [x, y, dtout] = readinput(inputfile);
    
    gifname = sprintf('%s_%s.gif', outputfile, inputfile); % name of gif
    command = sprintf('rm %s', gifname); % deletes old
    system(command); % does above
    
    filedir = sprintf("../outputs/%s.o",outputfile); % output file dir
    fid = fopen(filedir); % opens file
    
    [Omin, Omax] = getminmax(outputfile); % finds min/max Temp for scale
    
    i = 1;
    h = figure;
    
    while ~feof(fid)
        O = fgetmat(fid); % gets output matrix at every time-step
        surf(x,y,O); 
        
        if(outputfile == 'temp') % no colorbar if phase
            c = colorbar;
            ylc = ylabel(c, 'Temperature (K)', 'FontSize', 16, 'Rotation', 270);
            posy = get(c, 'Position');
            %set(ylc, 'Position', posy + [0 0 0]);
            caxis([Omin Omax]);
            ylabel('Y Dimension (m)');
            xlabel('X Dimension (m)');
            
        elseif(outputfile == 'phase')
            ylabel('Phase', 'FontSize', 16);
            
        end
        
        set(gca, 'FontSize', 16);
        colormap jet
        shading interp;
        view(0,90);
        pause(dtout); % time accurate plot
        
        gifmaker(gifname, h, i); % saves gif
        i = i + 1;
    end
    fclose(fid);
end