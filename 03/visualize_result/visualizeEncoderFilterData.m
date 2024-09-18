function [] = visualizeEncoderFilterData(gt_velocity_data, encoder_data, encoder_measure_time, encoder_average_filter_data, encoder_moving_average_filter_data, encoder_exponenital_moving_average_filter_data)
    figure;
    plot(encoder_measure_time, gt_velocity_data); hold on;
    plot(encoder_measure_time, encoder_data); hold on;
    plot(encoder_measure_time, encoder_average_filter_data); hold on;
    plot(encoder_measure_time, encoder_moving_average_filter_data); hold on;
    plot(encoder_measure_time, encoder_exponenital_moving_average_filter_data); hold on;
    legend('GT data', 'Sensor data', 'Average Filter data', 'Moving Average Filter data', 'Exponential Moving Average Filter data');
    title('Comparison Filter result'); hold on;
    xlabel('time(sec)');
    ylabel('m/s');
    grid on;

    %% 오차 plot
    figure;
    plot(encoder_measure_time, abs(gt_velocity_data - gt_velocity_data)); hold on;
    plot(encoder_measure_time, abs(gt_velocity_data - encoder_data)); hold on;
    plot(encoder_measure_time, abs(gt_velocity_data - encoder_average_filter_data)); hold on;
    plot(encoder_measure_time, abs(gt_velocity_data - encoder_moving_average_filter_data)); hold on;
    plot(encoder_measure_time, abs(gt_velocity_data - encoder_exponenital_moving_average_filter_data)); hold on;
    legend('GT data', 'Sensor data', 'Average Filter data', 'Moving Average Filter data', 'Exponential Moving Average Filter data');
    title('Comparison Filter Error'); hold on;
    xlabel('time(sec)');
    ylabel('Error');
    grid on;

end

