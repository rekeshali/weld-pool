function [O, Omin, Omax, i] = getoutput(outputfile, j)
    filedir = sprintf("../outputs/%s.o",outputfile); % output file dir
    fid = fopen(filedir); % opens file
    
    Omin = 1000000000000; % arbitrary initializers
    Omax = 0;
    i = 0;
    while ~feof(fid) % until the end of file
        i = i + 1;
        if j == 0 % animate
            O(:,:,i) = fgetmat(fid); % gets output matrix at every time-step
            mintemp = min(min(O(:,:,i)));
            maxtemp = max(max(O(:,:,i)));
        else % just last one
            O = fgetmat(fid);
            mintemp = min(min(O));
            maxtemp = max(max(O));            
        end

        
        if(maxtemp > Omax) % finds min and max Temps for plot scale
            Omax = maxtemp;
        end
        if(mintemp < Omin)
            Omin = mintemp;
        end
    end
    fclose(fid);
end