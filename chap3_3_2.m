
N=22;
M=100;
xx=linspace(-1,1,N);

yy=sin(2*pi*xx) + 9.5e-4*2*(rand(1,N) - 0.5);

hold off
plot(xx,yy,"o")
xlim([-1,1])
ylim([-1,1])
hold on

xxx=linspace(xx(1),xx(end),M);

# ラグランジェ補間を手動で行う
phi=ones(N,M);

for i=1:N
    for(j=1:N)
       if i != j
            phi(i,:).*=((xxx-xx(j))/(xx(i)-xx(j)));
        endif
    endfor
endfor

H = zeros(1,M);
for i=1:N
    H(1,:) += phi(i,:).*yy(i);
endfor

plot(xxx,H, "r")


#polyfit使用
#結果同じでした。。。苦労したのに。。
c=polyfit(xx,yy,N-1);
yfit=polyval(c,xxx);
plot(xxx,yfit,"k")

