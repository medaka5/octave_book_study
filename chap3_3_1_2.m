#表3.1の第２列のデータを全て使って補間
# polyfitを使う

x=linspace(-55,65,13)
y=[-3.25,-3.37,-3.35,-3.2,-3.12,-3.02,-3.02,-3.07,-3.17,-3.32,-3.3,-3.22,-3.1]

hold off
plot(x,y, "o")

# 4次の方がよく近似されてる
#c=polyfit(x,y,4)
c=polyfit(x,y,12)
z=linspace(x(1),x(end),100);
yy=polyval(c,z);
hold on
plot(z,yy, "r")
