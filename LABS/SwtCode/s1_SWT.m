% clear all;
% Input ori_gray.jpg(2-div gray) , canny.jpg (edge binary).
% OriImage =  imread('0ori_gray.png');
% EdgeImage = imread('1canny.png');
 OriImage = Pic_gray;
 EdgeImage = Pic_canny;
% EdgeImage(find(EdgeImage==255))=1;

% ------Mark Edge points 0 ------- 
EdgeImage(1,:)=0;
EdgeImage(:,1)=0;
EdgeImage(size(EdgeImage,1),:)=0;
EdgeImage(:,size(EdgeImage,2))=0;


height = size(EdgeImage,1);
width = size(EdgeImage,2);
SwtImage =double(inf(height,width));

[gradientX,gradientY] = gradient(double(OriImage),1,1); % ˫���Ȳ���ʹ���ݶȺ���
% mag = sqrt(gradientX.*gradientX+gradientY.*gradientY);

Angle=angle(gradientX+ 1i *gradientY);%%%%

% %  negative gradients % %%%%%%%%%%% freedom %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% gradientX = (-1)*gradientX;
% gradientY = (-1)*gradientY;


%  row=94;col=95;
for row = 1:height
    for col = 1:width
        if EdgeImage(row,col)==0  % ����ڱ�Եͼ�����ص�ֵΪ0�����Ǳ�Ե�㡣
            continue
        end
        
        if (  abs( Angle(row,col) ) >=pi/4 )&&(abs( Angle(row,col) ) <=3*pi/4 )
            for add=1:height
                yp=round((gradientY(row,col)/abs(gradientY(row,col)))*add+0);
                xp=round((gradientX(row,col)/abs(gradientY(row,col)))*add+0);
                if ((col+xp>1)&&(col+xp<width)&&(row+yp<height)&&(row+yp>1))
                    angle1=Angle(row,col);
                    angle2=Angle(row+yp,col+xp);
                    
                    if (EdgeImage(row+yp,col+xp)==1)&& (  abs(max(angle1,angle2)-min(angle1,angle2)-pi)<pi/2 )      % array
            %           SwtImage(row+add,col+xp)=0;  %��Ӧ��Ե
                        SwtImage(row,col) = sqrt(xp*xp+yp*yp);
                        
                        for bw = 1: add;   %%% �ʻ�֮���ֵ
                            ybw=round((gradientY(row,col)/abs(gradientY(row,col)))*bw+0);
                            xbw=round((gradientX(row,col)/abs(gradientY(row,col)))*bw+0);
                            SwtImage(row+ybw, col+xbw) = min(SwtImage(row,col),SwtImage(row+ybw,col+xbw));
                        end
                        break
                    end
                end
                
                % check the point near it   UP         
                if ((col+xp>1)&&(col+xp<width)&&(row+yp-1<height)&&(row+yp-1>1))
                    angle1=Angle(row,col);
                    angle2=Angle(row+yp-1,col+xp);
                    
                    if (EdgeImage(row+yp-1,col+xp)==1)&& (  abs(max(angle1,angle2)-min(angle1,angle2)-pi)<pi/2 )      % array
            %           SwtImage(row+add,col+xp)=0;  %��Ӧ��Ե
                        SwtImage(row,col) = sqrt(xp*xp+(yp-1)*(yp-1));
                        
                        for bw = 1: add;   %%% �ʻ�֮���ֵ
                            ybw=round((gradientY(row,col)/abs(gradientY(row,col)))*bw+0);
                            xbw=round((gradientX(row,col)/abs(gradientY(row,col)))*bw+0);
                            SwtImage(row+ybw, col+xbw) = min(SwtImage(row,col),SwtImage(row+ybw,col+xbw));
                        end
                        SwtImage(row+ybw-1, col+xbw) = min(SwtImage(row,col),SwtImage(row+ybw-1,col+xbw));
                        break
                    end
                end                  
                    
            end
            % %     %-------------------------------------------------------------
        else
            for add=1:width
                yp=round((gradientY(row,col)/abs(gradientX(row,col)))*add+0);
                xp=round((gradientX(row,col)/abs(gradientX(row,col)))*add+0);
                if ((col+xp>1)&&(col+xp<width)&&(row+yp<height)&&(row+yp>1))
                    angle1=Angle(row,col);
                    angle2=Angle(row+yp,col+xp);
                    if (EdgeImage(row+yp,col+xp)==1)&& (  abs(max(angle1,angle2)-min(angle1,angle2)-pi)<pi/2  )           % array
                        SwtImage(row,col) = sqrt(xp*xp+yp*yp);
                        
                        for bw = 1: add;   %%% �ʻ�֮���ֵ
                            ybw=round((gradientY(row,col)/abs(gradientX(row,col)))*bw+0);
                            xbw=round((gradientX(row,col)/abs(gradientX(row,col)))*bw+0);
                            SwtImage(row+ybw, col+xbw) = min(SwtImage(row,col),SwtImage(row+ybw,col+xbw));
                        end
                        break
                    end
                end
                
                                
                % check the point near it   UP    
                if ((col+xp>1)&&(col+xp<width)&&(row+yp-1<height)&&(row+yp-1>1))
                    angle1=Angle(row,col);
                    angle2=Angle(row+yp-1,col+xp);
                    if (EdgeImage(row+yp-1,col+xp)==1)&& (  abs(max(angle1,angle2)-min(angle1,angle2)-pi)<pi/2  )           % array
                        SwtImage(row,col) = sqrt(xp*xp+(yp-1)*(yp-1));
                        
                        for bw = 1: add;   %%% �ʻ�֮���ֵ
                            ybw=round((gradientY(row,col)/abs(gradientX(row,col)))*bw+0);
                            xbw=round((gradientX(row,col)/abs(gradientX(row,col)))*bw+0);
                            SwtImage(row+ybw, col+xbw) = min(SwtImage(row,col),SwtImage(row+ybw,col+xbw));
                        end
                        SwtImage(row+ybw-1, col+xbw) = min(SwtImage(row,col),SwtImage(row+ybw-1,col+xbw));
                        break
                    end
                end
                
            end          
        end
    end
end


% �ڶ���ɨ��
% row=555;col=210;
for row = 1:height
    for col = 1:width
        if EdgeImage(row,col)==0  % ����ڱ�Եͼ�����ص�ֵΪ0�����Ǳ�Ե�㡣
            continue
        end
        
        Swtsort=[];
        if (  abs( Angle(row,col) ) >=pi/4 )&&(abs( Angle(row,col) ) <=3*pi/4 )
            for add=1:height
                yp=round((gradientY(row,col)/abs(gradientY(row,col)))*add+0);
                xp=round((gradientX(row,col)/abs(gradientY(row,col)))*add+0);
                if ((col+xp>1)&&(col+xp<width)&&(row+yp<height)&&(row+yp>1))
                    angle1=Angle(row,col);
                    angle2=Angle(row+yp,col+xp);
                    Swtsort(add)= SwtImage(row+yp,col+xp);%%%
                    if (EdgeImage(row+yp,col+xp)==1)&& (  abs(max(angle1,angle2)-min(angle1,angle2)-pi)<pi/2 )           % array
                        Swtmedian=median(Swtsort);%%%
                        
                        for bw = 1: add;   %%% �ʻ�֮���ֵ
                            ybw=round((gradientY(row,col)/abs(gradientY(row,col)))*bw+0);
                            xbw=round((gradientX(row,col)/abs(gradientY(row,col)))*bw+0);
                            SwtImage(row+ybw, col+xbw) = min(Swtmedian,SwtImage(row+ybw,col+xbw));%%%
                        end
                        break
                        
                        
                    end
                end
                      % check the point near it   UP               
                      if ((col+xp>1)&&(col+xp<width)&&(row+yp-1<height)&&(row+yp-1>1))
                          angle1=Angle(row,col);
                          angle2=Angle(row+yp-1,col+xp);
                          Swtsort(add)= SwtImage(row+yp-1,col+xp);%%%
                          if (EdgeImage(row+yp-1,col+xp)==1)&& (  abs(max(angle1,angle2)-min(angle1,angle2)-pi)<pi/2 )           % array
                              Swtmedian=median(Swtsort);%%%
                              
                              for bw = 1: add;   %%% �ʻ�֮���ֵ
                                  ybw=round((gradientY(row,col)/abs(gradientY(row,col)))*bw+0);
                                  xbw=round((gradientX(row,col)/abs(gradientY(row,col)))*bw+0);
                                  SwtImage(row+ybw, col+xbw) = min(Swtmedian,SwtImage(row+ybw,col+xbw));%%%
                              end
                              SwtImage(row+ybw-1, col+xbw) = min(Swtmedian,SwtImage(row+ybw-1,col+xbw));%%%
                               break                             
                          end
                      end
                
                
            end  
              
            % %     %-------------------------------------------------------------
        else
            for add=1:width
                yp=round((gradientY(row,col)/abs(gradientX(row,col)))*add+0);
                xp=round((gradientX(row,col)/abs(gradientX(row,col)))*add+0);
                if ((col+xp>1)&&(col+xp<width)&&(row+yp<height)&&(row+yp>1))
                    angle1=Angle(row,col);
                    angle2=Angle(row+yp,col+xp);
                    Swtsort(add)= SwtImage(row+yp,col+xp);%%%
                    if (EdgeImage(row+yp,col+xp)==1)&& (  abs(max(angle1,angle2)-min(angle1,angle2)-pi)<pi/2  )           % array
                        Swtmedian=median(Swtsort);%%%
                        
                        for bw = 1: add;   %%% �ʻ�֮���ֵ
                            ybw=round((gradientY(row,col)/abs(gradientX(row,col)))*bw+0);
                            xbw=round((gradientX(row,col)/abs(gradientX(row,col)))*bw+0);
                            SwtImage(row+ybw, col+xbw) = min(Swtmedian,SwtImage(row+ybw,col+xbw));
                        end
                        break
                    end
                end
                
                                      % check the point near it   UP    
                if ((col+xp>1)&&(col+xp<width)&&(row+yp-1<height)&&(row+yp-1>1))
                    angle1=Angle(row,col);
                    angle2=Angle(row+yp-1,col+xp);
                    Swtsort(add)= SwtImage(row+yp-1,col+xp);%%%
                    if (EdgeImage(row+yp-1,col+xp)==1)&& (  abs(max(angle1,angle2)-min(angle1,angle2)-pi)<pi/2  )           % array
                        Swtmedian=median(Swtsort);%%%
                        
                        for bw = 1: add;   %%% �ʻ�֮���ֵ
                            ybw=round((gradientY(row,col)/abs(gradientX(row,col)))*bw+0);
                            xbw=round((gradientX(row,col)/abs(gradientX(row,col)))*bw+0);
                            SwtImage(row+ybw, col+xbw) = min(Swtmedian,SwtImage(row+ybw,col+xbw));
                        end
                             SwtImage(row+ybw-1, col+xbw) = min(Swtmedian,SwtImage(row+ybw-1,col+xbw));                       
                        break
                    end
                end
                
            end
        end
        
    end
end

% figure,image(SwtImage);
% % image=imadjust(image,stretchlim(image),[0 1]);
SwtImage= swthole(SwtImage);
% Display as Eng
SwtImage0=SwtImage;
SwtImage0(find(SwtImage==Inf))=0;


SwtGuiyi=guiyi(SwtImage0);
SwtGuiyi(find(SwtGuiyi==0))=255;
SwtGuiyi=uint8(fix(SwtGuiyi));

clear SwtImage0;
% figure,imshow(SwtGuiyi);
% % ��ʾ���
% figure,imshow(cat(3,SwtGuiyi,SwtGuiyi,SwtGuiyi));
% SwtImageMin=SwtImage;

% SwtImageModify=SwtGuiyi;


% %��hole again 
% SwtImageModify= swthole(SwtImageModify);

figure,imshow(SwtGuiyi);
%saveas(gcf(SwtGuiyi),'2swt.png');  %����������������ʱ������ʾgcf�������󣬿����޸ĳ�������仰
saveas(gcf(),'2_swt.png');
%imwrite(SwtGuiyi,'2swt.png'); %�����滻��������
clear LL8;
clear ll;
clear i;
clear j;



%% ǰ����ֻ�Ǽ���������ص��SWT����ֵ����ͼ��ʾ����δ��������λ��������SWT�������࣬���ı������Ƿ��ı�����