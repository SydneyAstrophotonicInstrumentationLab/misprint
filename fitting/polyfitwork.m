function [specCenters, p, mu]=polyfitwork(imdim,means,column,polyorder,plotalot)

if nargin<4
    plotalot=0;
end

numOrders=size(means,1);
numOfFibres=size(means,2);

p=zeros(numOrders,numOfFibres,polyorder+1);
mu=zeros(numOrders,numOfFibres,2);
specCenters=zeros(numOrders,numOfFibres,imdim(2));

for i=1:numOrders
    for j=1:numOfFibres
        
        [p(i,j,:),~,mu(i,j,:)]=polyfit(column',squeeze(means(i,j,:)),polyorder);
        specCenters(i,j,:)=polyval(squeeze(p(i,j,:)),1:imdim(2),[],squeeze(mu(i,j,:)));
        
        if plotalot
            %subplot(1,2,1)
            plot(column,squeeze(means(i,j,:)),'x',1:imdim(2),squeeze(specCenters(i,j,:)))
            %subplot(1,2,2)
            %plot(column,squeeze(means(i,j,:))-squeeze(specCenters(i,j,:)))
            pause(plotalot)
        end
    end
end
