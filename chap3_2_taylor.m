# 1/xをx0=1中心でテイラー展開し、x0=1の近傍以外では近似
# されないことを確認する

range=[1,3, 0, 3]

fun=@(x) (1./x)

fun_tail0 = @(x) (fun(x0));
fun_tail1 = @(x) (fun_tail0(x) -1/x0* (x-x0));
fun_tail2 = @(x) (fun_tail1(x)+ 1/x0^2 *(x-x0).^2);
fun_tail3 = @(x) (fun_tail2(x)- 1/x0^3 *(x-x0).^3);
fun_tail4 = @(x) (fun_tail3(x)+ 1/x0^4 *(x-x0).^4);
fun_tail5 = @(x) (fun_tail4(x)- 1/x0^5 *(x-x0).^5);
fun_tail6 = @(x) (fun_tail5(x)+ 1/x0^6 *(x-x0).^6);
fun_tail7 = @(x) (fun_tail6(x)- 1/x0^7 *(x-x0).^7);
fun_tail8 = @(x) (fun_tail7(x)+ 1/x0^8 *(x-x0).^8);
fun_tail9 = @(x) (fun_tail8(x)- 1/x0^9 *(x-x0).^9);
fun_tail10 = @(x) (fun_tail9(x)+ 1/x0^10 *(x-x0).^10);

hold off
fplot(fun, range, "r")

hold on
#fplot(fun_tail0, xrange, "b")
fplot(fun_tail1, xrange, "b")
fplot(fun_tail2, xrange, "b")
fplot(fun_tail3, xrange, "b")
fplot(fun_tail4, xrange, "b")
fplot(fun_tail5, xrange, "b")
fplot(fun_tail6, xrange, "b")
fplot(fun_tail7, xrange, "b")
fplot(fun_tail8, xrange, "b")
fplot(fun_tail9, xrange, "b")
fplot(fun_tail10, xrange, "b")


