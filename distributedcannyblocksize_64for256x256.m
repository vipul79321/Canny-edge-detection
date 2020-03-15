img=imread('lena_gray_256.tif');
%img=rgb2gray(img);
%img=imnoise(img,'salt & pepper',0.05);
imgb=img;
imgb1=zeros(256,256);
img_med=img;
mode_image_array=reshape(imgb,[1,256*256]);
mode_pixel=mode(mode_image_array);
mean_pixel=mode_pixel;
%round(mean(mean(imgb).'));
Tu=100;
Te=900;

for i =2:255
    for j=2:255
        classifier=[imgb(i-1,j-1),imgb(i-1,j),imgb(i-1,j+1),imgb(i,j-1),imgb(i,j),imgb(i,j+1),imgb(i+1,j-1),imgb(i+1,j),imgb(i+1,j+1)];
        img_med(i,j)=median(classifier);
        classifier=classifier.';
        x_bar=mean(classifier);
        square_x=mean(classifier.*classifier);
        var=9/8*(square_x-(x_bar*x_bar));
        
        if var <=Tu
            imgb1(i,j)=0;
        end
        if var >Tu
            if var <Te
                imgb1(i,j)=1;
            end
        end
        if var >=Te
            imgb1(i,j)=2;
        end
    end
end

for i=2:255
    classifier=[imgb(i-1,1+1),imgb(i-1,1),imgb(i-1,1+1),imgb(i,1),imgb(i,1+1),imgb(i,1+1),imgb(i+1,2),imgb(i+1,1),imgb(i+1,2)];
    img_med(i,j)=median(classifier);
    classifier=classifier.';
    x_bar=mean(classifier);
    square_x=mean(classifier.*classifier);
    var=9/8*(square_x-(x_bar*x_bar));
     if var <=Tu
            imgb1(i,1)=0;
     end
     if var >Tu
         if var <Te
             imgb1(i,1)=1;
         end
     end
        
     if var >=Te
           imgb1(i,1)=2;
     end
end

for i=2:255
    classifier=[imgb(i-1,255),imgb(i-1,255),imgb(i,255),imgb(i+1,255),imgb(i-1,256),imgb(i,255-1),imgb(i,256),imgb(i+1,256-1),imgb(i+1,256)];
    img_med(i,j)=median(classifier);
    classifier=classifier.';
    x_bar=mean(classifier);
    square_x=mean(classifier.*classifier);
    var=9/8*(square_x-(x_bar*x_bar));
     if var <=Tu
            imgb1(i,256)=0;
     end
     if var >Tu
         if var <Te
             imgb1(i,256)=1;
         end
     end
     if var >=Te
         imgb1(i,256)=2;
     end
end



for j=2:255
    classifier=[imgb(1,j-1),imgb(1,j),imgb(1,j+1),imgb(1+1,j-1),imgb(1+1,j-1),imgb(1+1,j),imgb(1+1,j+1),imgb(1+1,j),imgb(1+1,j+1)];
    img_med(i,j)=median(classifier);
    classifier=classifier.';
    x_bar=mean(classifier);
    square_x=mean(classifier.*classifier);
    var=9/8*(square_x-(x_bar*x_bar));
     if var <=Tu
         imgb1(1,j)=0;
     end
     if var >Tu
         if var <Te
             imgb1(1,j)=1;
         end
     end
     if var >=Te
         imgb1(1,j)=2;
     end
end

for j=2:255
    classifier=[imgb(255,j-1),imgb(255,j),imgb(255,j+1),imgb(256,j-1),imgb(256,j),imgb(256,j+1),imgb(255,j-1),imgb(255,j),imgb(255,j+1)];
    img_med(i,j)=median(classifier);
    classifier=classifier.';
    x_bar=mean(classifier);
    square_x=mean(classifier.*classifier);
    var=9/8*(square_x-(x_bar*x_bar));
     if var <=Tu
         imgb1(256,j)=0;
     end
     if var >Tu
         if var <Te
             imgb1(256,j)=1;
         end
     end
     if var >=Te
         imgb1(256,j)=2;
     end
end
    
%for (1,1)%
classifier=[mean_pixel,mean_pixel,mean_pixel,mean_pixel,imgb(1,1),imgb(1,2),mean_pixel,imgb(2,1),imgb(2,2)];
img_med(i,j)=median(classifier);
classifier=classifier.';
x_bar=mean(classifier);
square_x=mean(classifier.*classifier);
var=9/8*(square_x-(x_bar*x_bar));
if var <=Tu
    imgb1(1,1)=0;
end
if var >Tu 
    if var <Te
        imgb1(1,1)=1;
    end
end
if var >=Te
    imgb1(1,1)=2;
end

%for(1,256)%
classifier=[mean_pixel,mean_pixel,mean_pixel,mean_pixel,imgb(1,256),imgb(1,255),mean_pixel,imgb(2,256),imgb(2,255)];
img_med(i,j)=median(classifier);
classifier=classifier.';
x_bar=mean(classifier);
square_x=mean(classifier.*classifier);
var=9/8*(square_x-(x_bar*x_bar));
if var <=Tu
    imgb1(1,256)=0;
end
if var >Tu 
    if var <Te
        imgb1(1,256)=1;
    end
end
if var >=Te
    imgb1(1,256)=2;
end

%for(256,1)
classifier=[mean_pixel,mean_pixel,mean_pixel,mean_pixel,imgb(256,1),imgb(256,2),mean_pixel,imgb(255,1),imgb(255,2)];
img_med(i,j)=median(classifier);
classifier=classifier.';
x_bar=mean(classifier);
square_x=mean(classifier.*classifier);
var=9/8*(square_x-(x_bar*x_bar));
if var <=Tu
    imgb1(256,1)=0;
end
if var >Tu 
    if var <Te
        imgb1(256,1)=1;
    end
end
if var >=Te
    imgb1(256,1)=2;
end

%for (256,256)%
classifier=[mean_pixel,mean_pixel,mean_pixel,mean_pixel,imgb(256,256),imgb(256,255),mean_pixel,imgb(255,256),imgb(255,255)];
img_med(i,j)=median(classifier);
classifier=classifier.';
x_bar=mean(classifier);
square_x=mean(classifier.*classifier);
var=9/8*(square_x-(x_bar*x_bar));
if var <=Tu
    imgb1(256,256)=0;
end
if var >Tu 
    if var <Te
        imgb1(256,256)=1;
    end
end
if var >=Te
    imgb1(256,256)=2;
end

%pixel variance calculation done




%Gaussian filtering
B = [2, 4, 5, 4, 2; 4, 9, 12, 9, 4;5, 12, 15, 12, 5;4, 9, 12, 9, 4;2, 4, 5, 4, 2 ];
B = 1/159.* B;

%Gradient filter
Gx=[-sqrt(2)/4 ,0, sqrt(2)/4; -1, 0, 1;-sqrt(2)/4, 0 ,sqrt(2)/4 ];

Gy=[sqrt(2)/4, 1 ,sqrt(2)/4; 0 ,0, 0; -sqrt(2)/4, -1 , -sqrt(2)/4];
%Gx=[-1, 0, 1; -2 0 2; -1,0 ,1];
%Gy=[-1,-2,-1; 0, 0 ,0;1 ,2 ,1 ];

for k =1:4
    
    for x=1:4
        %block change in this loop%       
        block=zeros(68,68);
        count_0=0;
        count_1=0;
        count_2=0;
        P1=0;
        a=3;        
        for i=64*(k-1)+1 :64*k
            b=3;            
            for j=64*(x-1)+1 :64*x
                           
                %block(a,b)=img(i,j);
                block(a,b)=img_med(i,j);
                if imgb1(i,j)==0
                    count_0=count_0+1;
                end
                if imgb1(i,j)==1
                    count_1=count_1+1;
                end
                if imgb1(i,j)==2
                    count_2=count_2+1;
                end
                    
                b=b+1;    
                             
            end
                a=a+1;
        end
%         
        for q=3:66
            block(1,q)=block(5,q);
            block(2,q)=block(4,q);
            block(67,q)=block(65,q);
            block(68,q)=block(66,q);
        end
        for p=3:66
            block(p,1)=block(p,5);
            block(p,2)=block(p,4);
            block(p,67)=block(p,65);
            block(p,68)=block(p,66);
        end
        block(1,1)=block(5,5);
        block(1,2)=block(5,4);
        block(2,1)=block(4,5);
        block(2,2)=block(4,4);
        
        block(1,68)=block(5,64);
        block(1,67)=block(5,65);
        block(2,67)=block(4,65);
        block(2,68)=block(4,64);
        
        block(68,1)=block(64,5);
        block(68,2)=block(64,4);
        block(67,2)=block(65,4);
        block(67,1)=block(65,5);
        
        block(68,68)=block(64,63);
        block(68,67)=block(64,64);
        block(67,67)=block(65,65);
        block(67,68)=block(65,64);
        %fill block completely%
        
      
        
        if (count_0 >= 0.3*64*64) && (count_2==0)
            P1=0;
        end
        if (count_0 < 0.3*64*64) && (count_2==0)
            P1=0.03;
        end
        if (count_0<0.65*(64*64-count_2)) && (count_2>0)&&(count_2<0.3*64*64)
            P1=0.1;
        end
        if (count_0>=0.65*(64*64-count_2))&& (count_2>0)&&(count_2<0.3*64*64)
            P1=0.2;
        end
        if (count_0<=0.7 *64*64) &&(count_2>=0.3*64*64)
            P1=0.4;
        end
        
        count_0=0;
        count_1=0;
        count_2=0;
        
        %upto block classification done..now block smoothening
        %block=conv2(block, B, 'same');
        %smoothing by gaussian filter done
        
        %gradient calculation%
        GradientX=conv2(block,Gx,'same');
        GradientY=conv2(block,Gy,'same');
        Gradient_mag =GradientX.^2 +GradientY.^2;
        magnitude2 = sqrt(Gradient_mag);
        
       %Calculate directions/orientations
        angle = atan2(GradientY ,GradientX);
        angle = angle*180/pi;
        
        %Adjustment for negative directions, making all directions positive
        for p=1:68
            for q=1:68
                if (angle(p,q)<0) 
                    angle(p,q)=360+angle(p,q);
                end
            end
        end
        
        
        
        %Non-Maximum supression%
        BW=zeros(68,68);
        for p=3:66
            for q=3:66
                if (angle(p,q)==0)|| (angle(p,q)==180)
                    BW(p,q) =magnitude2(p,q) *(magnitude2(p,q) == max([magnitude2(p,q), magnitude2(p,q+1), magnitude2(p,q-1)]));
                elseif (angle(p,q)==45)||(angle(p,q)==225)
                    BW(p,q) = magnitude2(p,q)*(magnitude2(p,q) == max([magnitude2(p,q), magnitude2(p+1,q-1), magnitude2(p-1,q+1)]));
                elseif (angle(p,q)==90)||(angle(p,q)==270)
                    BW(p,q) = magnitude2(p,q)*(magnitude2(p,q) == max([magnitude2(p,q), magnitude2(p+1,q), magnitude2(p-1,q)]));
                elseif (angle(p,q)==135)||(angle(p,q)==315)
                    BW(p,q) = magnitude2(p,q)*(magnitude2(p,q) == max([magnitude2(p,q), magnitude2(p+1,q+1), magnitude2(p-1,q-1)]));
                
                elseif (angle(p,q)>0 && angle(p,q)<45)||(angle(p,q)>180 && angle(p,q)<225)
                    Pa=(magnitude2(p,q-1)+magnitude2(p+1,q-1))/2;
                    Pb=(magnitude2(p,q+1)+magnitude2(p-1,q+1))/2;
                    BW(p,q)=magnitude2(p,q)*(magnitude2(p,q)==max([magnitude2(p,q),Pa,Pb]));
                    
                elseif (angle(p,q)>45 && angle(p,q)<90)||(angle(p,q)>225 && angle(p,q)<270)
                    Pa=(magnitude2(p-1,q)+magnitude2(p-1,q+1))/2;
                    Pb=(magnitude2(p+1,q)+magnitude2(p+1,q-1))/2;
                    BW(p,q)=magnitude2(p,q)*(magnitude2(p,q)==max([magnitude2(p,q),Pa,Pb]));
                    
                elseif (angle(p,q)>90 && angle(p,q)<135)||(angle(p,q)>270 && angle(p,q)<315)
                    Pa=(magnitude2(p+1,q)+magnitude2(p+1,q+1))/2;
                    Pb=(magnitude2(p-1,q)+magnitude2(p-1,q-1))/2;
                    BW(p,q)=magnitude2(p,q)*(magnitude2(p,q)==max([magnitude2(p,q),Pa,Pb]));
                    
                elseif (angle(p,q)>135 && angle(p,q)<180)||(angle(p,q)>315 && angle(p,q)<360)
                    Pa=(magnitude2(p,q+1)+magnitude2(p+1,q+1))/2;
                    Pb=(magnitude2(p-1,q-1)+magnitude2(p,q-1))/2;
                    BW(p,q)=magnitude2(p,q)*(magnitude2(p,q)==max([magnitude2(p,q),Pa,Pb]));
                    
                end
                
                
            end
        end
       %NMS done%
        %gradient calculation done.. now threshold calculation
        histogram=zeros(64,64);
        for p=3:66
            for q=3:66
                histogram(p-2,q-2)=block(p,q);
            end
        end
        histogram=reshape(histogram,[1,64*64]);
        histogram=sort(histogram);
        mag_most=mode(histogram);
        max_gradient=histogram(64*64);
        min_gradient=histogram(1);
        R_1=(max_gradient+min_gradient)/2;
       
        R_2=(min_gradient+R_1)/2;
        R_3=(min_gradient+R_2)/2;
        R_4=(min_gradient+R_3)/2;
        R_5=(min_gradient+R_4)/2;
        R_6=(min_gradient+R_5)/2;
        R_7=(min_gradient+R_6)/2;
        R_8=(min_gradient+R_7)/2;
        
        R_i=[R_1,R_2,R_3,R_4,R_5,R_6,R_7,R_8];
        
        
        countR1=0;
        countR2=0;
        countR3=0;
        countR4=0;
        countR5=0;
        countR6=0;
        countR7=0;
        countR8=0;
        
        
        for p=1:64*64
            if histogram(p)<R_1
                countR1=countR1+1;
            end
            if histogram(p)<R_2
                countR2=countR2+1;
            end
            if histogram(p)<R_3
                countR3=countR3+1;
            end
            if histogram(p)<R_4
                countR4=countR4+1;
            end
            if histogram(p)<R_5
                countR5=countR5+1;
            end
            if histogram(p)<R_6
                countR6=countR6+1;
            end
            if histogram(p)<R_7
                countR7=countR7+1;
            end
            if histogram(p)<R_8
                countR8=countR8+1;
            end
        end
           
           absolute_diff=[abs(countR1-P1*64*64),abs(countR2-P1*64*64),abs(countR3-P1*64*64),abs(countR4-P1*64*64),abs(countR5-P1*64*64),abs(countR6-P1*64*64),abs(countR7-P1*64*64),abs(countR8-P1*64*64)]; 
           [minimum_difference,idx ]=min(absolute_diff);
           
           thres_factor=R_i(idx);
           threshold_high=(thres_factor+mag_most)/2;
           
           threshold_low=0.4*threshold_high;
                
       
       
       %adaptive thresholding%
        for p=1:68
            for q=1:68
                if (BW(p,q)>=threshold_high)
                    block(p,q)=255;
                end
                if (BW(p,q)<threshold_low)
                    block(p,q)=0;
                end
            end
        end
        flag=false;
        while(1-flag)
            temp=block;
            for p=3:66
                for q=3:66
                    if (BW(p,q)>=threshold_low) && (BW(p,q)<threshold_high)
                        if(BW(p-1,q-1)==255||BW(p-1,q)==255||BW(p-1,q+1)==255||BW(p,q-1)==255||BW(p,q+1)==255||BW(p+1,q-1)==255||BW(p+1,q)==255||BW(p+1,q+1)==255||BW(p-2,q-2)==255||BW(p-2,q-1)==255||BW(p-2,q)==255||BW(p-2,q+1)==255||BW(p-2,q+2)==255||BW(p-1,q-2)==255||BW(p-1,q+2)==255||BW(p,q-2)==255||BW(p,q+2)==255||BW(p+1,q-2)==255||BW(p+1,q+2)==255||BW(p+2,q-2)==255||BW(p+2,q-1)==255||BW(p+2,q)==255||BW(p+2,q+1)==255||BW(p+2,q+2)==255)
                            block(p,q)=255;
                                        
                        end
                    end
                end
            end
        flag=isequal(temp,block);   
        end
         for p=3:18
                 for q=3:18
                     if(BW(p,q)>=threshold_low &&BW(p,q)<threshold_high)
                         BW(p,q)=0;
                     end
                 end
         end
        %adaptive thresholding done.
        a=3;
        for i=64*(k-1)+1 :64*k
            b=3;
            for j=64*(x-1)+1 :64*x
              
                        final_img(i,j)=block(a,b);
            
               b=b+1;
            end
            a=a+1;
        end
end
end    

imshow(final_img);
        
                        
               
        
        
        
              
                
            
            
