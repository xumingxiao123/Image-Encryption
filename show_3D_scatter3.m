function   W =show_3D_scatter3(p)
%UNTITLED2 �˴���ʾ�йش˺�����ժҪ
%   �˴���ʾ��ϸ˵��
[M,N]=size(p);
figure
hold on
 for n = 1:(M/3)
    %�����������ά�ȵĳ��� 240�� facetN����
%    fill3(Vertex(3*n-2:3*n,1),Vertex(3*n-2:3*n,2),Vertex(3*n-2:3*n,3),'y',...
%       'EdgeAlpha',0.5)
scatter3(p(3*n-2:3*n,1),p(3*n-2:3*n,2),p(3*n-2:3*n,3))
       az = 230;
       el =-9;
% ��λ�� az �ǴӸ� y ��Χ�� z ��ˮƽ��ת�ĽǶȣ��Զ�Ϊ��λ����
% ��ֵ��ʾ����ʱ�뷽����ת�ӵ㡣el ���ӵ�Ĵ�ֱ���ǣ��Զ�Ϊ��λ����
% ����Ϊ��ֵ��Ӧ���ڶ����Ϸ��ƶ�����ֵ��Ӧ���ڶ����·��ƶ���
      view(3);
 end;
axis equal
box on

end