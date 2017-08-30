# チェビシェフ補間の威力を確認する

N=32;
#N=22;
M=1000;
#xx=linspace(-1,1,N);
# 補間点を等間隔にせず、両端の密度を上げる
xx=-cos(pi*[0:N-1]/(N-1));

yy=sin(2*pi.*xx) + 9.5e-4*2*(rand(1,N) - 0.5);

hold off
plot(xx,yy,"o")
xlim([-1,1])
ylim([-1,1])
hold on

xxx=linspace(xx(1),xx(end),M);

# ラグランジェ補間を手動で行う
phi=ones(N,M);

for ii=1:N
    for(jj=1:N)
       if ii != jj
            phi(ii,:).*=((xxx-xx(jj))/(xx(ii)-xx(jj)));
        endif
    endfor
endfor

H = zeros(1,M);
for ii=1:N
    H(1,:) += phi(ii,:).*yy(ii);
endfor

plot(xxx,H, "r")


#polyfit使用
#結果同じでした。。。苦労したのに。。
c=polyfit(xx,yy,N-1);
yfit=polyval(c,xxx);
plot(xxx,yfit,"k")

#　補間点の密度がわかりやすいようにx軸上にプロットする
plot(xx,zeros(1,N),".")
