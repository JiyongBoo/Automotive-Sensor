clear; close all;
%% [Reading NMEA Sentences Stored in a Log file]
% Opens the file gpsLog.txt with read access.
fileID = fopen('gpsLog.txt','r');
% Read the text file.
gpsData = fscanf(fileID,'%c');

parserObj = nmeaParser('MessageId','GGA');
% Parse the NMEA Data.
ggaData = parserObj(gpsData);

%% [Variables]
latitude = [ggaData.Latitude];
longitude = [ggaData.Longitude];
altitude = [ggaData.Altitude];

%% [ WGS84 coordinate plot ]

% 2D
figure("Name", "Raw gnss pose 2D at India");
geoplot(latitude, longitude, "r.-", 'LineWidth', 2); 
title('GPS Path at India');

% 위성 지도로 기본 지도 설정
geobasemap streets
grid off; 

% 3D
figure("Name", "Raw gnss pose 3D at India");
plot3(latitude, longitude, altitude, 'r.-', 'LineWidth', 2); % 3D 플롯 생성
xlabel('Latitude'); % x축 레이블 설정 (경도)
ylabel('Longitude'); % y축 레이블 설정 (위도)
zlabel('Altitude'); % z축 레이블 설정 (고도)
title('3D GPS Path at India'); % 그래프 제목 설정
grid on; % 그리드 켜기

% 3D 뷰 각도 설정
view(3);