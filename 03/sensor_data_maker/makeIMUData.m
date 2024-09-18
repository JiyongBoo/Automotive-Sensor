function [true_acceleration, measured_acceleration, t] = makeIMUData(end_of_time, sampling_frequency, noise_size)
    
    % make real acceleration data for simulation
    t = 0:1/sampling_frequency:end_of_time; % time vector
    true_acceleration = sin(2/6*pi*t); % 'real' acceleration which means 'gt'
    noise = noise_size*randn(size(t)); % add gaussian noise
    measured_acceleration = true_acceleration + noise; % sensor measured acceleration = real acceleration + noise
    
    % plot result
    figure;
    plot(t, true_acceleration, 'b', 'LineWidth', 2); hold on;
    plot(t, measured_acceleration, 'r:', 'LineWidth', 1); hold on;
    legend('True Acceleration', 'Measured Acceleration');
    xlabel('Time (seconds)');
    ylabel('Acceleration (m/s^2)');
    title('IMU Acceleration Data Filtering');
    grid on;
end

