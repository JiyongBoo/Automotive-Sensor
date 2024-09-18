function [] = visualizeEncoderSpeed(t,vehicleSpeed, estimatedSpeedCounting, estimatedSpeedTiming)
    figure
    plot(t, vehicleSpeed);
    hold on; grid on;
    plot(t, estimatedSpeedCounting);
    plot(t, estimatedSpeedTiming)
    hold on;

    xlabel('Time (seconds)');
    ylabel('Velocity (m/s)');
    
    legend('gt speed', 'estimated speed with pulse counting', 'estimated speed with pulse timing');
end

