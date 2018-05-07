function animate(inputfile, outputfile, x, y, MM, Q, dtout, dtquit)
    gifname = sprintf('%s_%s_%d_%d.gif', inputfile, outputfile, MM, Q); % name of gif
    command = sprintf('rm %s', gifname); % deletes old
    system(command); % does above
    [O, Omin, Omax, N] = getoutput(outputfile, 0); % gets min/max Temp for scale

    h = figure;
    hold on
    set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.1, 0.1, .6, 0.8]);
    set(gcf,'color','w');
    
    for i = 1:N
        surf(x,y,O(:,:,i));
        if(i == 1)
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
        end
        
        titstr = sprintf('time elapsed = %f s', (i-1)*dtout);
        if(outputfile(1:4) == 'temp') % no colorbar if phase
            titstr = sprintf('Temperature, %s', titstr);
            title(titstr);
        elseif(outputfile(1:5) == 'phase')
            titstr = sprintf('Phase, %s', titstr);
            title(titstr)
        end
        
        set(gca, 'FontSize', 20);
        colormap jet
        shading interp;
        clear figure
        view(0,90);
%         hold on;
        %pause(dtout/scale); % time accurate plot
        
        gifmaker(gifname, h, i); % saves gif
        if((i-1)*dtout > dtquit) % break at steady state
            break;
        end
        
    end
end