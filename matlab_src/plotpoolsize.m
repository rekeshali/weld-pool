function plotpoolsize(inputfile, MM, Q)
    filedir = sprintf("../outputs/values.o"); % output file dir
    fid = fopen(filedir); % opens file
    picname = sprintf('%s_size_%d_%d.png', inputfile, MM, Q);
    
    fgetl(fid); % useless
    data = fgetmat(fid);
    fclose(fid);
    time = data(:,2);
    width = data(:,3);
    depth = data(:,4);
   % energy = data(:,5);
    
    fig = figure;
    hold on
    set(gcf, 'Units', 'Normalized', 'OuterPosition', [0.1, 0.1, .6, 0.8]);
    set(gcf,'color','w');
    plot(time,width, 'LineWidth', 2);
    plot(time,depth, 'LineWidth', 2);
    xlim([0 max(time)]);
    xlabel('Time (ms)');
    ylabel('Size (cm)');
    tit = sprintf('%s, Pool Size, MM = %.0f, Q = %.0fW', inputfile, MM, Q);
    title(tit);
    legend({'Width','Depth'})
    set(gca, 'FontSize', 20);
    grid on
    
    frame = getframe(fig); 
    im = frame2im(frame); 
    [imind,cm] = rgb2ind(im,256); 
    imwrite(imind,cm,picname,'png', 'WriteMode','overwrite');
end