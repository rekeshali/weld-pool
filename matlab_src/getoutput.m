function [O, Omin, Omax, i] = getoutput(outputfile)
    filedir = sprintf("../outputs/%s.o",outputfile); % output file dir
    fid = fopen(filedir); % opens file
    
    Omin = 1000000000000; % arbitrary initializers
    Omax = 0;
    i = 0;
    while ~feof(fid) % until the end of file
        i = i + 1;
        O(:,:,i) = fgetmat(fid); % gets output matrix at every time-step
        mintemp = min(min(O(:,:,i)));
        maxtemp = max(max(O(:,:,i)));
        
        if(maxtemp > Omax) % finds min and max Temps for plot scale
            Omax = maxtemp;
        end
        if(mintemp < Omin)
            Omin = mintemp;
        end
    end
    fclose(fid);
end