function [x,y,dtout] = readinput(inputfile)
    % Reads input file for automatic plot generation
    filename = sprintf('../inputs/%s.i', inputfile); % file directory
    fID = fopen(filename); % open file
    
    fgetl(fID); % useless data
    fgetl(fID);
    
    buff = fgetl(fID); % line with dtout
    data = strsplit(buff);
    dtout = str2double(data{2}); % dtout secured
    
    fgetl(fID); % more useless 
    fgetl(fID);
    clear buff data
    buff = fgetl(fID); % line with MM, etc
    data = strsplit(buff);
    MM = str2double(data{1}); % dimensional data
    a = str2double(data{2});
    b = str2double(data{3});

    dx = 1/(MM-1);
    [x,y] = meshgrid(a:dx:b); % mesh for plotting secured
    
    fclose(fID); % being neat
end