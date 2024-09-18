function [estimated_speed] = PulseTimingMethod(t, pulses, pulsesPerRevolution)
    estimated_speed = zeros([length(t) 1]);
    
    %% ToDo
    for idx = 1:length(t)
        estimated_speed(idx) = 0;
    end
end

