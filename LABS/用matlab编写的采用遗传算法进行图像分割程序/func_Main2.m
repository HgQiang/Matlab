%-----------   Input   ----------------
Orig_I1=imread('sar.bmp');
%Orig_I1=c1;
Orig_I = double(Orig_I1) / 256;
figure,imshow(Orig_I);title('ԭ��ͼ��');axis on;
%-----------   Pre-processing   ----------------
now=[];
[nRow, nColumn] = size(Orig_I);
L=16;  %the size of moving windows
%expand_image=zeros(2*nRow,2*nColumn);
b=flipdim(Orig_I,1);
c=[b;Orig_I;b];
d=flipdim(c,2);
expand_image=[d c d];
seg_image=zeros(L);
[Row, Column] = size(expand_image);
%-----------   segmenting the image   ----------------  
 for i=nRow+1:Row-nRow
  for j=nColumn+1:Column-nColumn
           x=i;y=j;
         for m=1:L
              for n=1:L
                  seg_image(m,n)=expand_image(x-L/2+1,y-L/2+1);
                  y=y+1;
              end
              x=x+1;
              y=j;
          end     
          %-----------   Wavelet_packet Decomposition   ----------------
          level = 2;
          type = 'db1';
         
          [E_W] = func_wavelet_packet(seg_image,level,type);
          E_W=E_W';
          now=[now;E_W];
      end
 end
 %normalize the now matrix
[now_row,now_column]=size(now);
 max_now=max(now);
 min_now=min(now);
 fm=max_now-min_now;
 for j=1:now_column
    for i=1:now_row
        now(i,j)=( now(i,j)-min_now(j) )/ fm(j);
   end
 end
% FCM method making sort
[center,U,obj_fcn] = fcm(now,2);
maxU = max(U);                    % Find the data points with highest grade of membership in cluster 1
index1 = find(U(1,:) == maxU);    % Find the data points with highest grade of membership in cluster 2
index2 = find(U(2,:) == maxU);
for r=1:nRow
    for c=1:nColumn
         m=(r-1)*nColumn+c;
         size_now=size(index1,2);
         q=1;
         while (q<size_now+1)
               if index1(q)==m;
                   Orig_I1(r,c)=255;
                   break;
               end
               q=q+1;
          end
          if(q==size_now+1)
             Orig_I1(r,c)=0;
          end
     end
end
                    
figure,imshow(Orig_I1);title('�ָ��ͼ��');axis on;