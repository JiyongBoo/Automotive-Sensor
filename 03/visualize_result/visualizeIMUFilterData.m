function [] = visualizeIMUFilterData(gt_acceleration_data, imu_data, imu_measure_time, imu_average_filter_data, imu_moving_average_filter_data, imu_exponenital_moving_average_filter_data, imu_low_pass_filter_data)
    figure;
    plot(imu_measure_time, gt_acceleration_data, 'k-', linewidth=1); hold on;
    plot(imu_measure_time, imu_data, 'r-'); hold on;
    plot(imu_measure_time, imu_average_filter_data, 'g--', linewidth=1); hold on;
    plot(imu_measure_time, imu_moving_average_filter_data, 'y--', linewidth=2); hold on;
    plot(imu_measure_time, imu_exponenital_moving_average_filter_data, 'm:', linewidth=2); hold on;
    % plot(imu_measure_time, imu_low_pass_filter_data, 'y--', linewidth=1); hold on;
    legend('GT', 'Sensor', 'Average Filter', 'Moving Average Filter', 'Exponential Moving Average Filter');
    title('Comparison Filter result'); hold on;
    xlabel('time(sec)');
    ylabel('m/ss');
    grid on;

    %% error plot
    % plot
    figure;
    err_raw = gt_acceleration_data - imu_data;
    err_avg = gt_acceleration_data - imu_average_filter_data;
    err_mavg = gt_acceleration_data - imu_moving_average_filter_data;
    err_emavg = gt_acceleration_data - imu_exponenital_moving_average_filter_data;
    err_low = gt_acceleration_data - imu_low_pass_filter_data;
    plot(imu_measure_time, abs(err_raw), 'r--'); hold on;
    plot(imu_measure_time, abs(err_avg), 'g--', linewidth=1); hold on;
    plot(imu_measure_time, abs(err_mavg), 'b--', linewidth=1); hold on;
    plot(imu_measure_time, abs(err_emavg), 'm--', linewidth=1); hold on;
    plot(imu_measure_time, abs(err_low), 'y--', linewidth=1); hold on;
    legend('Sensor', 'Average Filter', 'Moving Average Filter', 'Exponential Moving Average Filter', 'Low Pass Filter');
    title('Comparison Filter result - Error'); hold on;
    xlabel('time(sec)');
    ylabel('Error(m/ss)');
    grid on;
    
    % histogram
    figure;
    histogram(err_raw);
    hold on;
    histogram(err_avg);
    histogram(err_mavg);
    histogram(err_emavg);
    histogram(err_low);
    legend('Sensor', 'Average Filter', 'Moving Average Filter', 'Exponential Moving Average Filter', 'Low Pass Filter');
    title('Histogram of Errors'); hold on;
    xlabel('Error (m/ss)');
    ylabel('Count');
    
    % boxplot
    figure;
    boxplot([err_raw', err_avg', err_mavg', err_emavg', err_low'], 'Labels',{'Sensor','Average Filter','Moving Average Filter','Exponential Moving Average Filter','Low Pass Filter'});
    title('Boxplot of Errors'); hold on;
    ylabel('Error (m/ss)');
end
