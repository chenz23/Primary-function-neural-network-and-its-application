clear;     
L = input('请输入样本数L=');
u = -1:2/L:1;
u_L = length(u);
d = 4*u./(1+4*u.*u);
a = input('请输入学习率a=');
K = input('请输入学习次数K=');
m = input('请输入隐藏层神经元个数m=');
w = eye(1,m);T(1)=1;

for k=1:K
    s1 = 0
    for i=1:u_L
        T(2) = u(i);
        for n=3:m
            T(n) = 2*u(i)*T(n-1)-T(n-2);
        end
        y = w*T';
        e = d(i) - y;
        dw = a*e*T;
        w = w+dw;
        s1 = s1+e*e;
    end
    se = .5*s1/(L+1);
    if(se<1.0e-9),k,break;end
end

 n = 0;
 for i=-1:0.03:1
     T(2) = i;
     n = n+1;
     for j=3:m
         T(j)=2*i*T(j-1)-T(j-2);
     end
     nny(n) = w*T';
 end
 
unn = -1:0.03:1;
dnn = 4*unn./(1+4*unn.*unn);
err_max1 = max(abs(dnn-nny))
err_max1 = max(100*(dnn-nny)./dnn)

subplot(1,3,1),plot(unn,dnn-nny)
xlabel('(a)绝对误差曲线');
subplot(1,3,2),plot(unn,(dnn-nny)./dnn)
xlabel('(b)相对误差曲线%');
subplot(1,3,3),plot(unn,dnn,unn,nny,'.')
xlabel('(c)实际输出...网络输出')
  
  
        
        


