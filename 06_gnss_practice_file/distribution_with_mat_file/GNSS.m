clear; close all;
%% [Load rosbag file]
addpath(cd());
strPath = fullfile(cd(), 'wgs84_conversion');
addpath(strPath);

bag = rosbag("hanyang_gps2.bag");

% Read messages of a specific topic
gps_data = readMessages(select(bag, 'Topic', '/ublox_gps/fix'));

%% [Variables]
num_messages = length(gps_data);
latitude = zeros(num_messages, 1);
longitude = zeros(num_messages, 1);
altitude = zeros(num_messages, 1);

%% [Practice] WGS84 convert to ENU with MatLab
for i = 1:length(gps_data)
    latitude(i) = gps_data{i}.Latitude;
    longitude(i) = gps_data{i}.Longitude;
    altitude(i) = gps_data{i}.Altitude;
end

lla = [latitude, longitude, altitude];

reference_point = [latitude(1), longitude(1), altitude(1)];

% Convert WGS84 to ENU
xyzENU = lla2enu(lla, reference_point, 'ellipsoid');

% Convert ENU to WGS84
xyzlla = enu2lla(xyzENU, reference_point, 'ellipsoid');

% 이미 읽어온 gps_data에서 위도와 경도 데이터 추출
latitude = zeros(num_messages, 1);
longitude = zeros(num_messages, 1);

for i = 1:num_messages
    latitude(i) = gps_data{i}.Latitude;
    longitude(i) = gps_data{i}.Longitude;
end

%% [Practice] Convert WGS84 - ENU with user defined transform
% Convert WGS84 to ENU
UserConvertENU = Wgs84ToEnu(lla, reference_point);

UserConvertLLH = EnuToWgs84(xyzENU, reference_point);


%% [ WGS84 coordinate plot ]

% 2D
figure("Name", "Raw gnss pose 2D");
geoplot(latitude, longitude, "r.", 'LineWidth', 2); 
title('GPS Path at Hanyang University');

% 위성 지도로 기본 지도 설정
geobasemap satellite 
% 지도의 한계 설정 (한양대학교 근처를 대략적으로 설정)
geolimits([37.5561 - 0.0006, 37.5561 + 0.0006], [127.0445 - 0.0006, 127.0445 + 0.0006]);

grid off; 

% 3D
figure("Name", "Raw gnss pose 3D");
plot3(latitude, longitude, altitude, 'r.', 'LineWidth', 2); % 3D 플롯 생성
xlabel('Latitude'); % x축 레이블 설정 (경도)
ylabel('Longitude'); % y축 레이블 설정 (위도)
zlabel('Altitude'); % z축 레이블 설정 (고도)
title('3D GPS Path at Hanyang University'); % 그래프 제목 설정
grid on; % 그리드 켜기

% 3D 뷰 각도 설정
view(3);

% Wgs84 convert result


%% [ENU coordinate plot]

% 2D
figure("Name", "ENU convert result"); 
hold on;
subplot(2,1,1)
plot(xyzENU(:,1), xyzENU(:,2), 'o-r'); % 동(East)과 북(North) 값으로 2D 플롯 생성
hold on;
plot(UserConvertENU(:,1), UserConvertENU(:,2), 'o-b');
axis equal;
legend("MatLab convert", "User convert");
xlabel('East (m)'); % x축 레이블 설정
ylabel('North (m)'); % y축 레이블 설정
title('2D ENU Position Plot'); % 그래프 제목 설정
grid off; 

% 3D
subplot(2,1,2)
plot3(xyzENU(:,1), xyzENU(:,2), xyzENU(:,3), 'o-r'); % 동(East), 북(North), 상(Up) 값으로 3D 플롯 생성
hold on;
plot3(UserConvertENU(:,1), UserConvertENU(:,2), UserConvertENU(:,3), 'o-b'); % 동(East), 북(North), 상(Up) 값으로 3D 플롯 생성
axis equal;
legend("MatLab convert", "User convert");
xlabel('East (m)'); % x축 레이블 설정
ylabel('North (m)'); % y축 레이블 설정
zlabel('Up (m)'); % z축 레이블 설정
title('3D ENU Position Plot'); % 그래프 제목 설정
grid off 

%% [WGS84 reconverse plot]

% 2D
figure("Name", "WGS84 convert result"); 
hold on;
subplot(2,1,1)
plot(xyzlla(:,2), xyzlla(:,1), 'o-r'); % 동(East)과 북(North) 값으로 2D 플롯 생성
hold on;
plot(UserConvertLLH(:,2), UserConvertLLH(:,1), 'o-b');
axis equal;
legend("MatLab convert", "User convert");
xlabel('Longitude (deg)'); % x축 레이블 설정
ylabel('Latitude (deg)'); % y축 레이블 설정
title('2D WGS84 Position Plot'); % 그래프 제목 설정
grid off; 

% 3D
subplot(2,1,2)
plot3(xyzlla(:,2), xyzlla(:,1), xyzlla(:,3), 'o-r'); % 동(East), 북(North), 상(Up) 값으로 3D 플롯 생성
hold on;
plot3(UserConvertLLH(:,2), UserConvertLLH(:,1), UserConvertLLH(:,3), 'o-b'); % 동(East), 북(North), 상(Up) 값으로 3D 플롯 생성
legend("MatLab convert", "User convert");
xlabel('Longitude (deg)'); % x축 레이블 설정
ylabel('Latitude (deg)'); % y축 레이블 설정
zlabel('Height (m)'); % z축 레이블 설정
title('3D WGS84 Position Plot'); % 그래프 제목 설정
grid off 
