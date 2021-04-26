function [calib] = importData(filename)
% importData - test function just to import the loadcell calibration curve
delimiterIn = ' ';
headerlinesIn = 1;
calib = importdata(filename,delimiterIn,headerlinesIn);
end

