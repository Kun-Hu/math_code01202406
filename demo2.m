clear;clc;close all;

eeee=1;NN=50;pbuchang=0.1;
for p=0.1:pbuchang:0.9
   clear PP ME qiwang QIWANG huitu_E
me=1;
  for N=1:NN
    for n=1:1:N
       PP(n,:)=(n.*(1-p).^(n-1)).*p;
    end
 ME{me}=PP;
 me=me+1;
  end

   for j=1:size(ME,2)
     qiwang=ME{j};
       for tt=1:size(qiwang,2)
             QI(tt)=sum(qiwang(:,tt));
       end
    QIWANG{j}=QI;%不同N下的期望值
   end

     for hh=1:size(QIWANG,2)
         huitu_E(hh)=QIWANG{hh};
     end
  EEEE(eeee,:)=huitu_E;
  eeee=eeee+1;
%   plot(huitu_E)
end

zhenshi=1./[0.1:pbuchang:0.9];
%    for pl=1:size(EEEE,1)
%        plot(1:1:NN,EEEE(pl,:),'linewidth',2)
%        xlabel('射击总次数N');
%        ylabel('数学期望');
% %          legend
%        hold on
%        plot(1:1:NN,zhenshi(pl).*ones(size(1:1:NN)),'--b')
%    end
   
%% 绘图
figure
 h1=plot(1:1:NN,EEEE(1,:),'-+','linewidth',1.5,'markersize',6);
 hold on
 h2= plot(1:1:NN,EEEE(2,:),'-o','linewidth',1.5,'markersize',4); 
    hold on
  h3=plot(1:1:NN,EEEE(3,:),'-*','linewidth',1.5,'markersize',6);
    hold on
  h4=plot(1:1:NN,EEEE(4,:),'-s','linewidth',1.5,'markersize',4);
  hold on
 h5= plot(1:1:NN,EEEE(5,:),'-x','linewidth',1.5,'markersize',4);
  hold on
  h6=plot(1:1:NN,EEEE(6,:),'-d','linewidth',1.5,'markersize',3);
  hold on;
 h7= plot(1:1:NN,EEEE(7,:),'-^','linewidth',1.5,'markersize',3);
  hold on
  h8=plot(1:1:NN,EEEE(8,:),'-.','linewidth',1.5,'markersize',4);
  hold on
  h9=plot(1:1:NN,EEEE(9,:),'--','linewidth',1.5,'markersize',4); 
 
 hold on
 plot(1:1:NN,zhenshi(1).*ones(size(1:1:NN)),'--b')
   hold on
 plot(1:1:NN,zhenshi(2).*ones(size(1:1:NN)),'--b')
 hold on
 plot(1:1:NN,zhenshi(3).*ones(size(1:1:NN)),'--b')
 hold on
 plot(1:1:NN,zhenshi(4).*ones(size(1:1:NN)),'--b')
 hold on
 plot(1:1:NN,zhenshi(5).*ones(size(1:1:NN)),'--b')
 hold on
 plot(1:1:NN,zhenshi(6).*ones(size(1:1:NN)),'--b')
 hold on
 plot(1:1:NN,zhenshi(7).*ones(size(1:1:NN)),'--b')
 hold on
 plot(1:1:NN,zhenshi(8).*ones(size(1:1:NN)),'--b')
 hold on
 plot(1:1:NN,zhenshi(9).*ones(size(1:1:NN)),'--b')
 xlim([1 50]) 
 grid minor
legend([h1,h2,h3,h4,h5,h6,h7,h8,h9],'p=0.1','p=0.2','p=0.3','p=0.4','p=0.5','p=0.6','p=0.7','p=0.8','p=0.9','Location','Northwest');
  xlabel('射击总次数X');
  ylabel('数学期望');
  set(gca, 'FontSize', 13); % 设置当前坐标轴的字体大小为14
%% 误差分析
  ERROR=abs( EEEE-zhenshi'.*ones(size(EEEE(1,:))) );
 figure;
%  colormap(jet)
 surf(1:NN,0.1:pbuchang:0.9,ERROR)
%  xlabel('射击总次数X');
%   ylabel('每次射击命中的概率p');
   zlabel('期望的绝对误差');
   colorbar
     set(gca, 'FontSize', 13); % 设置当前坐标轴的字体大小为14
colorbar; set(gca, 'CLim', [0  10]);
 grid minor

 figure 
  bar(ERROR(2,:))
  xlabel('射击总次数X');
  ylabel('p=0.2时射击次数X期望的绝对误差');
  set(gca, 'FontSize', 13); % 设置当前坐标轴的字体大小为14
  grid minor
 

