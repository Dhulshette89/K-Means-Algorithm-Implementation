clear all; close all;clc;
%Read the dataset%
X=dlmread('simple_iris_dataset.dat');
%Number of Clusters%
N=length(X);
% Initialization - take 2 random samples from data set 
ctr1 = X(randi([1,N]),:); 
ctr2 = X(randi([1,N]),:); 
prevctr1=ctr1;
prevctr2=ctr2;
count=1;
while true
i=1;
m=1;
 idx_c1=zeros(1,2);
 idx_c2=zeros(1,2);
for k=1:100
    eudistance1=sqrt(((ctr1(1,1)-X(k,1))^2)+((ctr1(1,2)-X(k,2))^2));
    eudistance2=sqrt(((ctr2(1,1)-X(k,1))^2)+((ctr2(1,2)-X(k,2))^2));
    if eudistance1>eudistance2
        idx_c2(i,:)=X(k,:);
        i=i+1;
        idx_c2=[idx_c2;zeros(1,2)];
    else
        idx_c1(m,:)=X(k,:);
        m=m+1;
         idx_c1=[idx_c1;zeros(1,2)];
    end
end
idx_c1=idx_c1(1:size(idx_c1,1)-1,:);
idx_c2=idx_c2(1:size(idx_c2,1)-1,:);
%Compute the new centroid%
ctr1=mean(idx_c1);
ctr2=mean(idx_c2);
if(ctr1(1,1)==prevctr1(1,1) && ctr1(1,2)==prevctr1(1,2) && ctr2(1,1)==prevctr2(1,1) && ctr2(1,2)==prevctr2(1,2))
    break;
end
prevctr1=ctr1;
prevctr2=ctr2;
count=count+1;
end

%To plot clustered data with two different colors%
figure; 
hold on;
xlabel('Sepal Length');
ylabel('Sepal Width'); 
plot(idx_c1(:,1),idx_c1(:,2),'r.','MarkerSize',12)
plot(idx_c2(:,1),idx_c2(:,2),'b.','MarkerSize',10)
%To plot centroid of each cluster on the same plot:%
plot(ctr1(:,1),ctr1(:,2), 'kx', 'MarkerSize',12,'LineWidth',2);
plot(ctr2(:,1),ctr2(:,2), 'ko', 'MarkerSize',12,'LineWidth',2);
%Print number of iterations required for convergence%
disp('Number of iterations required to achieve convergence :');
disp(count);