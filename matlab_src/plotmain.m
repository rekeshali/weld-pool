function plotmain(inputfile,outputfile, dtquit, tend)
    % Example: plotmain('debug','temp') runs the temp output from the debug
    % input file
    [x, y, dtout, ~, Tm, MM, Q] = readinput(inputfile); % gets mesh and dtout
    plotpoolsize(inputfile, MM, Q);
    plotend(inputfile, outputfile, x, y, MM, Q, tend/1000);
%     animate(inputfile, outputfile, x, y, MM, Q, dtout, dtquit)
end
