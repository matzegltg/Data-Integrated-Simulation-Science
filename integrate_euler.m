function q_results = integrate_euler(simtime,dt,m1,m2,l1,l2,d1,d2,I1,I2,q0_start, q1_start, q0_point_start, q1_point_start, u0_start, u1_start)
q_results = zeros(2, simtime/dt + 1);

q = zeros(2,1);
q(1,1) = - pi/2 + q0_start;
q(2,1) = q1_start;
q_results(:,1) = q;

q_point = zeros(2,1);
q_point(1,1) = q0_point_start;
q_point(2,1) = q1_point_start;

u = zeros(2,1);
u(1,1) = u0_start;
u(2,1) = u1_start;

q_pp = zeros(2,1);

for i=1:(simtime/dt)
    q_pp = M_of_q(m1, m2, l1, d1, d2, I1, I2, q(2,1)) \ (u - C_of_q(m1, m2, l1, d1, d2, q(1,1), q(2,1), q_point(1,1), q_point(2,1)));
    q_point = q_point + dt.*q_pp;
    q = q + dt.*q_point;
    q_results(:,i+1) = q;
    
end

q_results(1,:) = q_results(1,:) + pi/2;

end