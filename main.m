clc;
clear all;
imgname=['1','.jpg'];
while(1)
    for k=1:9;
        filename=sprintf('%d.jpg',k);
        f=imread(filename);
        imshow(f);
        pause(0.00000000000000001);
    end
end
