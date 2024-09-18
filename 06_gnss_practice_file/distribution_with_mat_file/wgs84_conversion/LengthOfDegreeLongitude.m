function lon_len = LengthOfDegreeLongitude(ref_latitude_deg)
% Convert latitude to radian
lat = deg2rad(ref_latitude_deg);

lat_len = LengthOfDegreeLatitude(ref_latitude_deg);

lon_len = lat_len * cos(lat);

end

