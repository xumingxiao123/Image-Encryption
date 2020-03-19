 function   P3=E_2(p,a1)
% p=P2;
% a1=A5;
[M,N]=size(p);
%扰动结果,带有混沌扰动项的算法
s1=zeros(M,N);
for i=1:M*N
    s1(i)=mod(floor(double(a1(i))*200),200);%这个值越大扩散越好2000
end
%------------------------------------------------------------------------------------
t1=zeros(M,N);
for i=1:M*N
t1(i)=bitxor(floor(p(i)),s1(i));
end
%fix(x)向0取离x最近的整数
%floor(x)取比x小的最接近的整数
%---------------------------------------扩散------------------------------------------
t2=zeros(M,N);
%置乱后的明文，前一个最终异或的结果，扰动结果
t2(1)=t1(1);
for i=1:M*N-1
t2(i+1)=bitxor(t2(i),t1(i+1));
end
% P3=reshape(uint8(t2),M,N);
P3=reshape(t2,M,N);
%test
% imwrite(P3,'de_test_lenna.bmp');
%  figure;
% imshow([p,P3]);
% figure;
% imhist(p);
% figure;
% imhist(t1);
% figure;
% imhist(P3);