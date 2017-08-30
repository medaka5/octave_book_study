# 1/xをx0=1中心でテイラー展開し、x0=1の近傍以外では近似
# されないことを確認する
# 形を変えて整理

N=10   # N次まで展開
M=100  # x軸の点の数
x=linspace(1,3,M);


# 展開する関数
fun=@(x) (1./x);
x0=1;

hold off
y0=fun(x);
plot(x,y0)
xlim([1,3])
ylim([0,3])
hold on

y=zeros(N+1,M);    # n行に、n-1次のテイラー展開したときの計算結果が入る

y(1,:) = fun(x0);
for i=1:N   # i次のテイラー展開は、i+1行目
    y(i+1,:)= y(i,:) + (-1)^i / (x0)^i * (x-x0).^i;
    plot(x,y(i+1,:))
endfor



