function particles = propagate(particles, sizeFrame, params)

[n_particles, dim] = size(particles);

if params.model == 0 % (no motion)
    A = eye(2);
    particles = A * particles' + randn(dim, n_particles) * params.sigma_position;
    particles = particles';
else % params.model == 1 (constant velocity)
    A = [1 0 1 0;
         0 1 0 1;
         0 0 1 0;
         0 0 0 1];
    particles = A * particles' + [randn(2, n_particles)*params.sigma_position;
                                  randn(2, n_particles)*params.sigma_velocity];
    particles = particles';
end

% Make sure that the particles lie inside the frame
for i = 1:n_particles
    if particles(i,1) < 0
        particles(i,1) = 0;
    elseif particles(i,1) > sizeFrame(1)
        particles(i,1) = sizeFrame(1);
    elseif particles(i,2) < 0
        particles(i,2) = 0;
    elseif particles(i,2) > sizeFrame(2)
        particles(i,2) = sizeFrame(2);
    end
end


end