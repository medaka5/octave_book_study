# 例題 3.6

hold off
cla
clf


# オリジナルの関数
fun=@(x) (x .* (x - 2 * pi) .* exp(-x));

N=1000;  # numbers for plot
xxx=linspace(0,2*pi,N);
fplot(fun,[0,2*pi])
hold on


M=10;     # 補間点の数
#xx=2*pi*[0:M-1]./M

yy=fun(xx);
plot(xx,yy,"or")


Y=fft(yy);
C=fftshift(Y)/M;

Hokan=zeros(1,N);

for ii=1:M
    Hokan+=C(ii) * exp(i* (-(M/2)+(ii-1)) * xxx);
endfor

plot(xxx,Hokan)


# 同じことをinterpft()つかってやってみる
z=interpft(yy,N);

plot(xxx,z, "y")





