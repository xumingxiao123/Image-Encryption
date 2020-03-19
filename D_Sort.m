function P=D_Sort( p,a2 )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
[M,N]=size(p);

% 逆2-排序置乱
 P1=zeros(M,N);
Q=reshape(p,1,[]);%[]为自动计算维度

[D, C]=sort(a2);%排序算法，将a2按照升序排序，返回D，C为D原来的数组下标

for i=1:M*N
P1(i)=Q(C(i));%逆排序下标
end
P=reshape(P1,M,N);
end