function z1=Histogram(p1,meth,meth1)
% bar3(E3);
% bar3(Vertex);
MAX=floor(max(max(p1)))+1;
MIN=min(min(p1)); 
[M,N]=size(p1);
switch meth 
        case '10' 
        t=(MAX-MIN)/10;
        z=zeros(10,10); 
       case '20' 
        t=(MAX-MIN)/20;
        z=zeros(20,20); 
     case '50' 
        t=(MAX-MIN)/50;
        z=zeros(50,50); 
    case '100' 
        t=(MAX-MIN)/100;
        z=zeros(100,100); 
    otherwise 
end
switch meth1 
    case 'xy' 
  p=1;
  q=2;
    case 'xz' 
  p=1;
  q=3;
    case 'yz'
  p=2;
  q=3;
    otherwise 
end
for x=0:t:(MAX-MIN)-t
for y=0:t:(MAX-MIN)-t
for nx=1:M
%   if (x<Vertex(nx,1)&&Vertex(nx,1)<x+200&&y<Vertex(nx,2)&&Vertex(nx,2)<y+200)
     if (x<=p1(nx,p)&&p1(nx,p)<x+t&&y<=p1(nx,q)&&p1(nx,q)<y+t)
          nxx=floor(x/t)+1;
          nyy=floor(y/t)+1;
                 z(nxx,nyy)=z(nxx,nyy)+1;
%                     z(x,y);
end 
end
end
end
% z=[10 21 23 14 35 26 47;21 32 33 24 35 26 17;15 23 23 44 25 34 27];
% y=[2013 2014 2015];
% x=[1 2 3 4 5 6 7];
bar3(z);
switch meth1 
    case 'xy' 
xlabel('xy平面');
    case 'xz' 
xlabel('xz平面');
    case 'yz'
xlabel('yz平面');
    otherwise 
end
z1=z;
end
% xlim(gca,[-20,20]);
% ylim(gca,[-20,20]);
% set(gca,'YTickLabel',{'大一','大二','大三','大四','硕一','硕二','硕三'});
% xlabel('年级');ylabel('年份');zlabel('人数');
% bar3(Z) 绘制三维条形图，Z 中的每个元素对应一个条形图。如果 Z 是向量，y 轴的刻度范围是从 1 至 length(Z)。如果 Z 是矩阵，则 y 轴的刻度范围是从 1 到 Z 的行数。
%bar3(Y,Z) 在 Y 指定的位置绘制 Z 中各元素的条形图，其中 Y 是为垂直条形定义 y 值的向量。y 值可以是非单调的，但不能包含重复值。如果 Z 是矩阵，则 Z 中位于同一行内的元素将出现在 y 轴上的相同位置