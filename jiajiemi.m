%% 读取txt文件
Vertex=read_STL_ASCII('美国地形图asciistl.txt');
[M,N]=size(Vertex);
 %% 展示三维图形
%  show_3D_fill3(Vertex,M);
  %% 哈希化并且生成密钥
h =hash(Vertex,'SHA512');
b1=T_16_to_2(h,480);
%  b2=T_2_to_10(b1,12);
b2=Dx_1(b1); %目前是12个秘钥

%% 混沌系统迭代生成伪随机序列
T=200;%迭代200次
[A,random]=DCML(b2,Vertex,T,8);
%% 明文排序置乱 A2
A2=A(2,T+1:T+M*N);
P1=Sort(Vertex,A2);
%% 生成异或时所需要的值 %和密钥和混沌系统无关
MAX_1=floor(max(max(Vertex)));
MAX_2=dec2bin(MAX_1);
[m1,n1]=size(MAX_2);
MAX_22= zeros(1,n1);
for n=1:n1
   MAX_22(n)=str2double(MAX_2(n));
end
 for n=1:n1-1
         MAX_22(n)=1;
 end
bitxor=0;
 for n=1:n1
 bitxor=MAX_22(n1-n+1)*2^(n-1)+bitxor;
 end
 bitxor=bitxor+1;
%% 生成随机点
% bitxor=247;
A1=A(1,T+1:T+random);
A11=A(1,T+random+1:T+random*2); 
T1=floor(D_bitxor*A1)+roundn(A11,-4);%生成随机点
T2=reshape(T1,random/3,3); %生成随机点矩阵
%% 连接P1与随机点再次置乱 A3
P2=[P1;T2];
[M1,N1]=size(P2);
A3=A(3,T+1:T+M1*N1);
P3=Sort(P2,A3);
% P3=D_1(P2,A7,A3);
%% 生成异或时所需要的值 %这个值是由图像中的最大值，密钥和混沌系统生成的
% MAX_1=floor(max(max(Vertex)));%明文数组内的最大值
% MAX_2=dec2bin(MAX_1);
% [m1,n1]=size(MAX_2);
% MAX_22= zeros(1,n1);
% for n=1:n1
%    MAX_22(n)=str2double(MAX_2(n));
% end
% MAX_222=MAX_22;
% A1_bit=A(1,M1*N1+T-n1+2:M1*N1+T);
% for n=2:n1-1
%     if (A1_bit(n)>=0.5)
%         MAX_222(n)=1;
%     else
%          MAX_222(n)=0;
%     end
% end
% bitxor=0;
% for n=1:n1
% bitxor=MAX_222(n1-n+1)*2^(n-1)+bitxor;
% end
%% 逐行提取伪随机序列
A4=A(4,T+1:T+M1*N1);
A5=A(5,T+1:T+M1*N1);
A6=A(6,T+1:T+M1*N1);
A7=A(7,T+1:T+M1*N1);
A8=A(8,T+1:T+M1*N1);
%% 分解整数与小数部分
P4=floor(P3);
P44=P3-P4;
%% 整数部分异或 A4
P5=Bitxor(P4,A4,bitxor);
% show_3D_fill3(P5,M1);
%  figure;
%  H=Histogram(P5,'100','xy');
%% 小数部分加密 相加 不可相减，不然有可能得到负数无法进行下去
A55=roundn(A5,-4);
P55=zeros(M1,N1);
A555=reshape(A55,[M1,N1]);
P55=P44+A555;
%% 组合生成密文
P6=P5+P55;
% show_3D_fill3(P6,M1);
%  figure;
% Histogram(Vertex,'100','xy');
%  figure;
% H=Histogram(P6,'100','xy');
% write_STL_ASCII(P6,'密文');
%% 密钥有b2 第一位到第五位，第10位到第12位，异或所需数字246
%% 分解整数与小数部分
Q6=P6;
 QQ5=floor(Q6);%整数
 Q55=Q6-QQ5;%小数
 Q44=Q55-A555;%判断是否进位
 Q5=zeros(M1,N1);
 for n=1:M1*N1
     if(Q44(n)<0)
         Q5(n)=QQ5(n)-1;%Q5是加密后异或后的整数
     else
         Q5(n)=QQ5(n);
     end
 end
 %% 生成异或时所需要的值 %和密钥和混沌系统无关
D_MAX_1=floor(max(max(Q5)));
D_MAX_2=dec2bin(MAX_1);
[m1,n1]=size(D_MAX_2);
D_MAX_22= zeros(1,n1);
for n=1:n1
   D_MAX_22(n)=str2double(D_MAX_2(n));
end
 for n=1:n1-1
         D_MAX_22(n)=1;
 end
D_bitxor=0;
 for n=1:n1
 D_bitxor=D_MAX_22(n1-n+1)*2^(n-1)+D_bitxor;
 end
 D_bitxor=D_bitxor+1;
 %% 整数部分异或
 Q4=D_Bitxor(Q5,A4,D_bitxor);
 %% 小数部分相减
 %% 相加
 Q33=Q4+Q44;
 Q3=zeros(M1,N1);
  for n=1:M1*N1
     if(Q44(n)<0)
         Q3(n)=Q33(n)+1;%Q5是异或后的整数
     else
         Q3(n)=Q33(n);
     end
  end
 
 %%  解除置乱
 Q2=D_Sort(Q3,A3);
 %% 删除多余矩阵
 Q1=Q2(1:M1-random/3,:);
 %% 解除置乱
  V=D_Sort(Q1,A2);
%   show_3D_fill3(V);