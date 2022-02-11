% 0 = 18.4C; 255 = 34.4C
clear; clc; close all
dT= (34.4 - 18.4)/256;
T = 0:1:255;
T = 18.4 + T.*dT; %Temperature corresponding to 0-255 values in the image

%%

mean_finger_tip = zeros(28,1);
for i=1:40
    file_name = sprintf('C:\\Users\\dell\\Documents\\Labs\\RamakrishnaSir\\IR_camera\\roshni_left\\%d.Tif', i);
    I = imread(file_name);
    figure(1); 
    imshow(I); set(gcf, 'Position', get(0, 'Screensize'));
    [row,col]=ginput(2);
    row=round(sort(row));
    col=round(sort(col));
    rectangle('Position',[row(1), col(1), row(2)-row(1), col(2)-col(1)], 'LineWidth',3, 'EdgeColor','b');
    finger_tip = I(col(1):col(2), row(1):row(2));
    mean_finger_tip(i) = mean2(finger_tip);
      
end


%%
mean_finger_tip = round(mean_finger_tip);
save('left_value_region1.mat', 'mean_finger_tip');
mean_finger_tip = mean_finger_tip +1; %Shift 1-256 from 0-255
temperature_finger_tip =  T(mean_finger_tip);
temperature_finger_tip = temperature_finger_tip'; 
save('left_temp_region1.mat', 'temperature_finger_tip');

%%

for i=1:40
    file_name = sprintf('C:\\Users\\dell\\Documents\\Labs\\RamakrishnaSir\\IR_camera\\roshni_left\\%d.Tif', i);
    I = imread(file_name);
    f= figure(1); hold on 
    contourf(I);caxis([0 200])
    saveas(f,sprintf('Contour%d.png',i));     
end









