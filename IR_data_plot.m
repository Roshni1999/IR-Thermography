clear; clc; close all;
NUM = xlsread('temp_measured.xlsx');

figure(1); set(gca,'fontsize',14); hold on;
plot(NUM(1:28,1), NUM(1:28,2), '-*', LineWidth=1);
plot(NUM(1:28,1), NUM(1:28,3), '-*', LineWidth=1);
xlabel('Time (minutes) post cold provocation');
ylabel(' Temperature (C)');
legend('Thermocouple', 'IR Camera'); xlim([ 0 28])
title('Right Hand Index Finger Temperature')

figure(2); set(gca,'fontsize',14); hold on;
plot(NUM(1:40,1), NUM(1:40,4), '-*', LineWidth=1);
plot(NUM(1:40,1), NUM(1:40,5), '-*', LineWidth=1);
xlabel('Time (minutes) post cold provocation');
ylabel(' Temperature (C)');
legend('Thermocouple', 'IR Camera')
title('Left Hand Middle Finger Temperature')

%%
bg = [1 1 1; 0 0 0];
colors = distinguishable_colors(13, bg);

for i = 1:13
    figure(3); set(gca,'fontsize',14); hold on;
    load(sprintf('Right_data\\right_temp_region%d', i));
    plot(NUM(1:28,1), temperature_finger_tip, '-*', 'Color', colors(i,:), LineWidth=1 );
    xlabel('Time (minutes) post cold provocation'); ylabel(' Temperature (C)');
    title('Right Hand Temperature at 13 regions')
end
xlim([0 28])
legend('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13');


for i = 1:13
    figure(4); set(gca,'fontsize',14); hold on;
    load(sprintf('Left_data\\left_temp_region%d', i));
    plot(NUM(1:40,1), temperature_finger_tip, '-*', 'Color', colors(i,:), LineWidth=1 );
    xlabel('Time (minutes) post cold provocation'); ylabel(' Temperature (C)');
    title('Left Hand Temperature at 13 regions')
end
xlim([0 28])
legend('1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13');

%%


