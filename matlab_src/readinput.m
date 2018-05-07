function [x, y, dtout, tend, Tm, MM, Q] = readinput(inputfile)
    % Reads input file for automatic plot generation
    filename = sprintf('../inputs/%s.i', inputfile); % file directory
    fID = fopen(filename); % open file
    
    fgetl(fID); % useless data
    fgetl(fID);
    
    buff = fgetl(fID); % line with dtout
    data = strsplit(buff);
    dtout = str2double(data{2});% dtout secured
    tend = str2double(data{3}); % tend
    
    fgetl(fID); % more useless 
    fgetl(fID);
    clear buff data
    buff = fgetl(fID); % line with MM, etc
    data = strsplit(buff);
    MM = str2double(data{1}); % dimensional data
    a = str2double(data{2});
    b = str2double(data{3});
    
    fgetl(fID); % more useless 
    fgetl(fID);
    clear buff data
    buff = fgetl(fID); % line with Tm, etc
    data = strsplit(buff);
    Tm = str2double(data{3});

    fgetl(fID); % more useless 
    fgetl(fID);
    fgetl(fID);
    fgetl(fID);
    clear buff data
    buff = fgetl(fID); % line with Tm, etc
    data = strsplit(buff);
    Q = str2double(data{2});
    
    
    M = MM*(b-a);
    gridline = linspace(a,b,M);
    [x,y] = meshgrid(gridline); % mesh for plotting secured
    x = x*100;
	y = y*100;
    fclose(fID); % being neat
end
