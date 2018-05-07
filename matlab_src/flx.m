 filedir = sprintf("../outputs/flxdst.o"); % output file dir
    fid = fopen(filedir); % opens file
    picname = 'flxdst8000W1000MM.png';

    data = fgetmat(fid);
    fclose(fid);
    x = data(:,1);
    flux = data(:,2);
    
    fig = figure;
    hold on
    set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.1, 0.1, .6, 0.8]);
    set(gcf,'color','w');
    plot(x*100, flux, 'LineWidth', 2);
%     xlim([0 max(time)]);
    xlabel('Position (cm)');
    ylabel('Flux (W)');
%     tit = sprintf('%s, Pool Size, MM = %.0f, Q = %.0fW', inputfile, MM, Q);
    title('Boundary Flux Distribution, MM = 5000');
    set(gca, 'FontSize', 20);
    grid on
    
    frame = getframe(fig); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
    imwrite(imind,cm,picname,'png', 'WriteMode','overwrite');