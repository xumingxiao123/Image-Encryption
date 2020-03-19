function P1=E_1(p,a1,a2)

% p=P;
%a1=A1;
%a2=A2;

[M,N]=size(p);
% 1-费雪耶兹置乱 
for i=M*N-1:-1:3%对生成的混沌序列进行置乱
j=floor(a1(i)*i)+1; %a1是生成的混沌序列，通过得到的混沌序列进行选取,向上取整
k=p(i);
p(i)=p(j);
p(j)=k;
end
% 2-排序置乱
[M,N]=size(p);
[D,C]=sort(a2);%将a2排序 d是c重新排列后原来的数组下标，描述了 A 的元素沿已排序的维度在 B 中的排列情况
f1(C)=p;
P1=reshape(f1,M,N);
end
%test
 % figure;
% imshow([P,p,P1]);