function data = fgetmat(fid)
% Rekesh Ali
% Function quits at eof or empty line!
i = 1;
while ~feof(fid)
    line = fgetl(fid);
    if isempty(line)
        break;
    end
    data(i,:) = sscanf(line, '%f');
	i = i + 1;
end