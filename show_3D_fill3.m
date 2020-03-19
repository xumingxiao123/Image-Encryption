function   W =show_3D_fill3(p)
%UNTITLED2 此处显示有关此函数的摘要
%   此处显示详细说明
[M,N]=size(p);
figure
hold on
 for n = 1:(M/3)
    %返回最大数组维度的长度 240是 facetN长度
   fill3(p(3*n-2:3*n,1),p(3*n-2:3*n,2),p(3*n-2:3*n,3),'y',...
       'EdgeAlpha',0.5)
%scatter3(p(3*n-2:3*n,1),p(3*n-2:3*n,2),p(3*n-2:3*n,3))
      % az = 230;
       %el =-9;
% 方位角 az 是从负 y 轴围绕 z 轴水平旋转的角度（以度为单位）。
% 正值表示按逆时针方向旋转视点。el 是视点的垂直仰角（以度为单位）。
% 仰角为正值对应于在对象上方移动；负值对应于在对象下方移动。
      view(3);
 end;
axis equal
box on
end

