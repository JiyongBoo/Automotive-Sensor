function [estimated_speed] = PulseCountingMethod(t,pulses, pulsesPerRevolution, time_interval)
    estimated_speed = zeros([length(t) 1]);
    
    %% ToDo
    for idx = 1:length(t)
        estimated_speed(idx) = 0;
    end
end

