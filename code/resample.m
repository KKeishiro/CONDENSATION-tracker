function [new_particles, new_particles_w] = resample(particles, particles_w)

n_particles = length(particles);
r = 1/n_particles * rand();
c = particles_w(1);
i = 1;

new_particles = [];
new_particles_w = [];
for m = 1:n_particles
   U = r + 1/n_particles * (m-1); 
   while U > c
       i = i+1;
       c = c + particles_w(i);
   end
   
   new_particles = [new_particles; particles(i,:)];
   new_particles_w = [new_particles_w; particles_w(i)];
end
new_particles_w = new_particles_w / sum(new_particles_w);

end