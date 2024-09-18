function llh = EnuToWgs84(enu,ref_llh)
llh = zeros(size(enu));

for idx = 1 : size(llh,1)
    llh(idx, 1) = 0.0;
    llh(idx, 2) = 0.0;
    llh(idx, 3) = 0.0;
end

%% Todo
a = 6378137.0;
b = 6356752.314245;

ref_lat_deg = ref_llh(1);
ref_lon_deg = ref_llh(2);
ref_alt_deg = ref_llh(3);

ref_lat_rad = deg2rad(ref_lat_deg);
rel_lon_rad = deg2rad(ref_lon_deg);

M = (a*b)^2 / ((a*cos(ref_lat_rad))^2+(b*sin(ref_lat_rad)^2))^(3/2);
N = a*a / sqrt((a*cos(ref_lat_rad))^2 + (b*sin(ref_lat_rad))^2);

for idx = 2 : size(llh,1)
    delt_E = enu(idx,1);
    h = enu(idx,3);
    delta_lon = delt_E/((N+h)*cos(ref_lat_rad));
    llh(idx,2) = ref_lon_deg+rad2deg(delta_lon);
    delt_N = enu(idx,2);
    delta_lat = delt_N/(M+h);
    llh(idx,1) = ref_lat_deg+rad2deg(2*delta_lat);
    llh(idx,3) = h+ref_alt_deg;
end
llh(1,1) = ref_llh(1);
llh(1,2) = ref_llh(2);
llh(1,3) = ref_llh(3);
end
