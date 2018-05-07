function plotmain(inputfile,outputfile, dtquit)
    % Example: plotmain('debug','temp') runs the temp output from the debug
    % input file
    [x, y, dtout, tend, Tm, MM, Q] = readinput(inputfile); % gets mesh and dtout
    plotpoolsize(inputfile, MM, Q);
    plotend(inputfile, outputfile, x, y, MM, Q, tend);
%     animate(inputfile, outputfile, x, y, MM, Q, dtout, dtquit)
end
