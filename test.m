filename= 'result.gif'; %���gif�ļ�������
for i=1:9
    str=sprintf('%d.jpg',i);
    Img=imread(str);
    figure(i)
    imshow(Img);
    frame=getframe(i);
    im=frame2im(frame);%����gif�ļ���ͼ�������index����ͼ��
    [I,map]=rgb2ind(im,256);
    k=i-0;
    if k==1;
        imwrite(I,map,filename,'gif','Loopcount',inf,...
            'DelayTime',0.1);%loopcountֻ����i==1��ʱ�������
    else
        imwrite(I,map,filename,'gif','WriteMode','append',...
            'DelayTime',0.000000001);
    end
end