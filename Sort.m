function P=Sort(p,a )
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
[M,N]=size(p);
% 逆2-排序置乱
% 2-排序置乱
[D,C]=sort(a);%将a2排序 d是c重新排列后原来的数组下标，描述了 A 的元素沿已排序的维度在 B 中的排列情况
f1(C)=p;
P=reshape(f1,M,N);
end