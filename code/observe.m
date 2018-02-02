function particles_w = observe(particles, frame, H, W, hist_bin, hist_target, sigma_observe)

heightFrame = size(frame, 1);
widthFrame = size(frame, 2);
% Compute color histograms for all particles
hist_particles = zeros(length(particles), hist_bin*3);
for i = 1:length(particles)
    hist_particles(i,:) = color_histogram(min(max(1,floor(particles(i,2)-0.5*W)),widthFrame), ...
                                          min(max(1,floor(particles(i,1)-0.5*H)),heightFrame),...
                                          min(max(1,floor(particles(i,2)+0.5*W)),widthFrame), ...
                                          min(max(1,floor(particles(i,1)+0.5*H)),heightFrame),...
                                          frame, hist_bin);
end

particles_w = zeros(length(particles), 1);
for i = 1:length(particles)
    particles_w(i) = (1/(sqrt(2*pi)*sigma_observe))*exp(-0.5*chi2_cost(hist_target,hist_particles(i,:))/sigma_observe^2);
end

% Normalization
particles_w = particles_w / sum(particles_w);
sum(particles_w)
end