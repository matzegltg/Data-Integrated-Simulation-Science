function C = C_of_q(m1, m2, l1, d1, d2, q1, q2, q1_point, q2_point)
C = zeros(2,1);
C(1,1) = -2.*m2.*l1*d2.*q1_point.*sin(q1).*q2_point - m2.*l1.*d2.*(q2_point.^2).*sin(q2) + m1*9.81*d1*cos(q1) + m2*l1*cos(q1) + m2*9.81*d2*cos(q1 + q2);
C(2,1) = -m2*l1*d2*q1_point*sin(q2)*q2_point + m2*9.81*d2*cos(q1 + q2) + m2*l1*d2*(q1_point.^2)*sin(q2) + m2*l1*d2*q2_point*q1_point*sin(q2);

end