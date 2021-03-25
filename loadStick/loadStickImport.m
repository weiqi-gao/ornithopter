clc;
close all;
clearvars;
xo = 2; %x orientation [euler angle]
%yo = 3; %y orientation [euler angle]
%zo = 4;%z orientation [euler angle]
%xrot = 5;%x rotation
%yrot = 6;%y rotation
%zrot = 7;%z rotation
%xlin = 8;%x linear
%ylin = 9;%y linear
%zlin = 10;%z linear
%xmag = 11;%x magnetometer
%ymag = 12;%y magnetometer
%zmag = 13;%z magnetometer
%xa1 = 14;%x acceleration 1
%ya1 = 15;%y acceleration 1
%za1 = 16;%z acceleration 1
%xa2 = %x acceleration 2
%ya2 = %y acceleration 2
%za2 = %z acceleration 2
calib = 'rawCalibration_reformat.txt';
file1 = '1aI_reformat.txt';
file2 = '1b2_reformat.txt';
file3 = '1cI_reformat.txt';
file4 = '1dI_reformat.txt';
delimiterIn = ' ';
headerlinesIn = 1;
A0 = importdata(calib,delimiterIn,headerlinesIn);
A1 = importdata(file1,delimiterIn,headerlinesIn);
A2 = importdata(file2,delimiterIn,headerlinesIn);
A3 = importdata(file3,delimiterIn,headerlinesIn);
A4 = importdata(file4,delimiterIn,headerlinesIn);

fiveplot(1,A0,A1,A2,A3,A4);
sgtitle('Load Cell');
fiveplot(2,A0,A1,A2,A3,A4);
sgtitle('x orientation');

function fiveplot(colnum,dat0,dat1,dat2,dat3,dat4)
    A0 = dat0;
    A1 = dat1;
    A2 = dat2;
    A3 = dat3;
    A4 = dat4;
    figure;
    subplot(2,3,1);
    plot(A0.data(:,colnum));
    title('Calibration');
    subplot(2,3,2);
    plot(A1.data(:,colnum));
    title('Run1:NoWings?');
    subplot(2,3,3);
    plot(A2.data(:,colnum));
    title('Run2:WingsOn');
    subplot(2,3,4);
    plot(A3.data(:,colnum));
    title('Run3:WingsOn');
    subplot(2,3,5);
    plot(A4.data(:,colnum));
    title('Run4:WingsOn');
end