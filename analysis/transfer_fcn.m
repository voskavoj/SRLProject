g_p = 4;
g_i = 2;
g_d = 3;

PI1 = tf([g_p, g_i],[1, 0])

long = linsys1([1,3,5,10,12],[3,5,6,7,8])

damper = long(3,1)*g_d
figure()
bode(damper)

Damper = feedback(long, g_d, 1, 3)
figure()
bode(Damper)
