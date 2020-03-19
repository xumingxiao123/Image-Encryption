%--------------------------解密流程--------------------------------------
Vertex1=read_STL_ASCII('密文.txt');
[M,N]=size(Vertex1);
%show_3D_scatter3(Vertex1,M1);
%show_3D_fill3(Vertex1,M1);
%带入初值，迭代200次，达到充分混沌状态
u0=0.5;
x0=0.2357;
x=x0;
u=3.89+0.11*u0;
for i=1:200
    x=u*x*(1-x);
end
%产生A1······················
A1=zeros(1,M*N);
A1(1)=x;
for i=1:M*N-1
A1(i+1)=u*A1(i)*(1-A1(i));
end
%产生A2
A2=zeros(1,M*N);
A2(1)=A1(M*N);
for i=1:M*N-1
A2(i+1)=u*A2(i)*(1-A2(i));
end
%产生A3
A3=zeros(1,M*N);
A3(1)=A2(M*N);
for i=1:M*N-1
A3(i+1)=u*A3(i)*(1-A3(i));
end
%产生A4
A4=zeros(1,M*N);
A4(1)=A3(M*N);
for i=1:M*N-1
A4(i+1)=u*A4(i)*(1-A4(i));
end
%产生A5
A5=zeros(1,M*N);
A5(1)=A4(M*N);
for i=1:M*N-1
A5(i+1)=u*A5(i)*(1-A5(i));
end
D1=D_2(Vertex1,A3);
show_3D_scatter3(D1,M);
show_3D_fill3(D1,M);
%------------------------------------
T3=floor(Vertex1);
T4=(Vertex1-T3)*10000;
F2=D_1(T4,A4,A5);
%------------------------------------
% P1=D_2(P2,A1,A2);
D2=D_1(D1,A1,A2);
D3=D2+F2*0.0001;
show_3D_scatter3(D3,M);
show_3D_fill3(D3,M);
%-------------------------------------
write_STL_ASCII(D3,'明文');