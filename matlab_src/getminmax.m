function [Omin, Omax] = getminmax(outputfile)
    filedir = sprintf("../outputs/%s.o",outputfile); % output file dir
    fid = fopen(filedir); % opens file
    
    Omin = 1000000000000; % arbitrary initializers
    Omax = 0;
    i = 1;
    while ~feof(fid) % until the end of file
        O = fgetmat(fid); % gets output matrix at every time-step
        mintemp = min(min(O));
        maxtemp = max(max(O));
        
        if(maxtemp > Omax) % finds min and max Temps for plot scale
            Omax = maxtemp;
        end
        if(mintemp < Omin)
            Omin = mintemp;
        end
        i = i + 1;
    end
    fclose(fid);
end