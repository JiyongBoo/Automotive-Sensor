function lat_len = LengthOfDegreeLatitude(ref_latitude_deg)
% Convert latitude to radian
lat = deg2rad(ref_latitude_deg);

% Set up "Constants"
a = 6378137.0;
b = 6356752.314245;

lat_len = a*a / sqrt((a*cos(lat))^2 + (b*sin(lat))^2);
end

