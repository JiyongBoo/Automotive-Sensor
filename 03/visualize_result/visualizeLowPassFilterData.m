function [] = visualizeLowPassFilterData(imu_measure_time,imu_low_pass_filter_data,imu_data,gt_acceleration_data, sampling_frequency)
    % calculate error
    difference = abs(imu_low_pass_filter_data - gt_acceleration_data);
    sum_of_absolute_differences = sum(difference(:));
    absolute_mean_error = sum_of_absolute_differences / length(difference);
    
    fprintf("Error: %.3f\n", absolute_mean_error);

    figure
    plot(imu_measure_time, imu_low_pass_filter_data, 'g'); hold on; grid on;
    plot(imu_measure_time, imu_data, 'r:'); hold on;
    legend('Filter data', 'Measured data');
    
    [p, f] = pspectrum(imu_low_pass_filter_data, sampling_frequency);
    figure
    plot(f, 10*log10(p)); hold on; grid on;
    xlabel('Frequency (Hz)')
    ylabel('Power/Frequency (dB/Hz)')
end

