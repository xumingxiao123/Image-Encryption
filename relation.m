function ccd=relation(a,number)
%% 定义一维矩阵 
    [M,N]=size(a);
    s1=double(zeros(1,number));
    s2=double(zeros(1,number));
    s3=double(zeros(1,number));
    h=double(zeros(1,number));  %水平方向%
    v=double(zeros(1,number));  %垂直方向%
    d=double(zeros(1,number));  %对角线方向%
    %% 从矩阵行中随机选相邻点
    for k=1:number
        i = ceil(rand(1, 1) * M);  %ceil向上取整% rand生成0到1上的随机数
        j = ceil(rand(1, 1) * N);
        if i==M 
            i=i-1;
        end
        if j==N
            j=j-1;%边界点不要
        end
        s1(k)=double(a(i+1,j+1));% 存储随机点
        h(k)=double(a(i,j+1)); % 存储垂直方向点
       % v(k)=double(a(i+1,j));
       % d(k)=double(a(i,j));
    end
     for k=1:number
         i = ceil(rand(1, 1) * M);  %ceil向上取整%
         j = ceil(rand(1, 1) * N);
         if i==M 
             i=i-1;
         end
         if j==N
             j=j-1;
         end
         s2(k)=double(a(i+1,j+1));
         v(k)=double(a(i+1,j)); % 存储水平方向点
     end
     for k=1:number
         i = ceil(rand(1, 1) * M);  %ceil向上取整%
         j = ceil(rand(1, 1) * N);
         if i==M 
             i=i-1;
         end
         if j==N
             j=j-1;
         end
        s3(k)=double(a(i+1,j+1)); % 存储对角线方向点
        d(k)=double(a(i,j));
     end
    
%---成像
    figure;
  subplot(1,1,1);%subplot(m,n,p) 将当前图窗划分为 m×n 网格，并在 p 指定的位置创建坐标区。MATLAB? 按行号对子图位置进行编号。第一个子图是第一行的第一列，第二个子图是第一行的第二列，依此类推。如果指定的位置已存在坐标区，则此命令会将该坐标区设为当前坐标区
    plot(s1,h,'.') ;%plot(X,Y) 创建 Y 中数据对 X 中对应值的二维线图
    title('垂直方向');
    figure;
    subplot(1,1,1);
    plot(s2,v,'.'); %s2 前一个点 后一个点的y轴
    title('水平方向');
    figure;
    subplot(1,1,1);
    plot(s3,d,'.');
    title('对角线方向');
        %%%%%%系统计算的相关系数，有问题，每次运行结果不同%%%%%%%%%

    cch = corrcoef(s1, h);
    ccv = corrcoef(s1, v);
    ccd = corrcoef(s1, d);

     sum=0.0;
     sum=double(sum);
     for i=1:number
         sum=sum+s1(i);
     end
     Ex=double(sum/number);
     sum=0.0;
     sum=double(sum);
     for i=1:number
         sum=sum+h(i);
     end
     Ey=double(sum/number);
     sum=0.0;
     sum=double(sum);
     for i=1:number
         sum=sum+(s1(i)-Ex)^2;
     end
     Dx=double(sum/number);
     sum=0.0;
     sum=double(sum);
     for i=1:number
         sum=sum+(h(i)-Ey)^2;
     end
     Dy=double(sum/number);
     
     sum=0.0;
     sum=double(sum);
     for i=1:number
         sum=sum+(s1(i)-Ex)*(h(i)-Ey);
     end
     cov=double(sum/number);
     ccd=double(cov/sqrt(Dx*Dy));
end
    
    
    