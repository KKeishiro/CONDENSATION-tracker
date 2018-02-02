function meanState = estimate(particles, particles_w)

meanState = particles' * particles_w;
meanState = meanState';
end