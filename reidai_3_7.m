hold off
cla
clear

fun = @(x) (sin(x) + sin(5*x))

fplot(fun, [0, 2*pi])
hold on

#x=linspace(0,2*pi,9);
n=7;
x=2*pi/(n+1)*[0:n]

y=fun(x);
plot(x,y,"o")

# フーリエ変換で補間

N=100;
xx=linspace(0,2*pi,N);
xx=xx(1:N-1);
z=interpft(y,N-1);

plot(xx,z,"r")

