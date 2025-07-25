
% Generates a 600x600 phantom of two circles called "phantom".
% Large circle centered at (300, 300) with radius of 70
% Circle centered at (234.24, 165.18) with raidus of 30.

phant = zeros(600);
for i = 1:600
    for j = 1:600
        if (i - 300)^2 + (j - 300)^2 < 70^2
            phant(i,j) = 1;
        elseif (i - 234.24)^2 + (j - 165.18)^2 < 30^2
            phant(i,j) = 0.5;            
        end
    end
end

%Displays generated phantom

h1 = pcolor(phant); axis square
set(h1,'EdgeAlpha',0); colorbar
clear h1 i j

%Computes fan-beam projection of generated phantom
[F,Fpos,Fangles] = fanbeam(phant,426,'FanSensorGeometry','arc','FanRotationIncrement',1, 'FanSensorSpacing', 1.08);

%Displays the sinogram
figure
imshow(F,[],'XData',Fangles,'YData',Fpos,...
            'InitialMagnification','fit')
axis normal
xlabel('Rotation Angles (degrees)')
ylabel('Sensor Positions (degrees)')
colormap(gca,hot), colorbar

disp(size(Fangles))
disp(size(Fpos))

%Computes fan-beam to parallel-beam conversion  of generated phantom
[Precovered,Ploc,Pangles] = fan2para(F,426, 'ParallelCoverage', 'cycle', 'ParallelRotationIncrement', 1.08, 'ParallelSensorSpacing', 10);

%Ifan1 = ifanbeam(F,426,'FanCoverage', 'cycle','OutputSize',output_size, 'Filter', 'Hamming');

%Displays the sinogram after the conversion
figure
imshow(Precovered,[],...
       'XData',Pangles,'YData',Ploc,'InitialMagnification','fit') 
axis normal
title('Recovered Parallel-Beam Data')
xlabel('Rotation Angles (degrees)')
ylabel('Parallel Sensor Locations (pixels)')
colormap(gca,hot), colorbar

%disp(size(Pangles))
%disp(size(Ploc))

%Computes the inverse Radon 
out_size = max(size(phant));

I1 = iradon(Precovered,1.08,out_size);

%Displays the recovered image 
figure;
imagesc([1:600],[1:600],(I1));
axis square;
colorbar;
axis xy; 
