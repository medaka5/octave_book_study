# ラグランジェの補間多項式を体感する

xx=linspace(0,2,5)

#yy=zeros(1,5)
yy=[3,2,-4,1,2]

hold off
plot(xx,yy,"+")

fun1=@(x)( ( (x-xx(2)).*(x-xx(3)).*(x-xx(4)).*(x-xx(5))) / ((xx(1)-xx(2)).*(xx(1)-xx(3)).*(xx(1)-xx(4)).*(xx(1)-xx(5))));

fun2=@(x)( ( (x-xx(1)).*(x-xx(3)).*(x-xx(4)).*(x-xx(5))) / ((xx(2)-xx(1)).*(xx(2)-xx(3)).*(xx(2)-xx(4)).*(xx(2)-xx(5))));


fun3=@(x)( ( (x-xx(1)).*(x-xx(2)).*(x-xx(4)).*(x-xx(5))) / ((xx(3)-xx(1)).*(xx(3)-xx(2)).*(xx(3)-xx(4)).*(xx(3)-xx(5))));

fun4=@(x)( ( (x-xx(1)).*(x-xx(2)).*(x-xx(3)).*(x-xx(5))) / ((xx(4)-xx(1)).*(xx(4)-xx(2)).*(xx(4)-xx(3)).*(xx(4)-xx(5))));

fun5=@(x)( ( (x-xx(1)).*(x-xx(2)).*(x-xx(3)).*(x-xx(4))) / ((xx(5)-xx(1)).*(xx(5)-xx(2)).*(xx(5)-xx(3)).*(xx(5)-xx(4))));

y1=fun1(xx);
y2=fun2(xx);
y3=fun3(xx);
y4=fun4(xx);
y5=fun5(xx);


# 式 (3.4)のとおりに書いてみる
Hokan = @(x) ( yy(1)*fun1(x) + yy(2)*fun2(x) + yy(3)*fun3(x) + yy(4)*fun4(x) + yy(5)*fun5(x)) 

hold on
fplot(Hokan,[0,2])

# polyfit使ってみる
c=polyfit(xx,yy,4)
z=linspace(xx(1),xx(end),100);
p=polyval(c,z);
plot(z,p, ".k")

