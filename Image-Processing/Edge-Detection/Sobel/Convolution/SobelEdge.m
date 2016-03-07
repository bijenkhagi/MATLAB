%%%Edge Detection using Soble kernel
%%% Author: Alok Mistry
%%% image: imref.bmp 640x960

%getting image from local folder
img=imread('imgref.bmp');
figure(1);imshow(img);
img=rgb2gray(img);
img=double(img);

%defining Sobel kernel
kernel_gy=[1 2 1;0 0 0;-1 -2 -1];
kernel_gx=[-1 0 1;-2 0 2;-1 0 1];

%measuring Time
t=cputime;

%Perform Convolution
conv_x=conv2(img,kernel_gx,'same');
conv_y=conv2(img,kernel_gy,'same');

%taking each pixel at a time, in 2D Matrix i j
for i = 1: size (conv_x,1)
       for j=1: size(conv_y,2)
           %B (i, j) = abs (conv_x(i,j)) + abs (conv_y(i,j)); 
           B (i, j) = sqrt (conv_x(i,j)^2 +conv_y(i,j)^2);
       end
end

%Defining Threshold value
Thresh=100;
B = max (B, Thresh); 
B (B == round (Thresh)) = 0; 

B = uint8 (B);

%getting the time elapsed
disp('The time taken by CPU is:');
e=cputime-t

figure(2);imshow(B);
