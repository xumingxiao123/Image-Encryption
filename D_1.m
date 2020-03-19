function P1=D_1( p,a1,a2 )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
[M,N]=size(p);

% 逆2-排序置乱
p2=p;
P1=zeros(M,N);
Q=reshape(p2,1,[]);%[]为自动计算维度

[D, C]=sort(a2);%排序算法，将a2按照升序排序，返回D，C为D原来的数组下标

for i=1:M*N
P1(i)=Q(C(i));%逆排序下标
end

% 逆1-费雪耶兹置乱 
for i=3:1:M*N-1
j=floor(a1(i)*i)+1;
k=P1(i);
P1(i)=P1(j);
P1(j)=k;
end

P1=reshape(P1,M,N);

end

