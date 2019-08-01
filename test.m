filename= 'result.gif'; %你的gif文件的名字
for i=1:9
    str=sprintf('%d.jpg',i);
    Img=imread(str);
    figure(i)
    imshow(Img);
    frame=getframe(i);
    im=frame2im(frame);%制作gif文件，图像必须是index索引图像
    [I,map]=rgb2ind(im,256);
    k=i-0;
    if k==1;
        imwrite(I,map,filename,'gif','Loopcount',inf,...
            'DelayTime',0.1);%loopcount只是在i==1的时候才有用
    else
        imwrite(I,map,filename,'gif','WriteMode','append',...
            'DelayTime',0.000000001);
    end
end