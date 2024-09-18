function enu = Wgs84ToEnu(llh,ref_llh)
enu = zeros(size(llh));

for idx = 1 : size(llh,1)
    enu(idx, 1) = 0.0;
    enu(idx, 2) = 0.0;
    enu(idx, 3) = 0.0;
end

%% Todo
% Set up "Constants"
a = 6378137.0;
b = 6356752.314245;

ref_lat_deg = ref_llh(1);
ref_lon_deg = ref_llh(2);
ref_alt_deg = ref_llh(3);

ref_lat_rad = deg2rad(ref_lat_deg);
ref_lon_rad = deg2rad(ref_lon_deg);

M = (a*b)^2 / (((a*cos(ref_lat_rad))^2+(b*sin(ref_lat_rad)^2))^(3/2));
N = a*a / sqrt((a*cos(ref_lat_rad))^2 + (b*sin(ref_lat_rad))^2);

for idx = 2 : size(enu,1)
    delt_lon = deg2rad(llh(idx,2)) - ref_lon_rad;
    h = llh(idx,3)-ref_alt_deg;
    E_enu = (N+h)*cos(ref_lat_rad)*delt_lon;
    enu(idx,1) = E_enu;
    delt_lat = deg2rad(llh(idx,1))-ref_lat_rad;
    N_enu = (M+h)*delt_lat;
    enu(idx,2) = N_enu/2;
    enu(idx,3) = h;
end


    
    

end


