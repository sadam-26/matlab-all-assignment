img=imread('MPLGroup.jpg');
faced=vision.CascadeObjectDetector();
faced.MergeThreshold=6;
bbox=step(faced,img);
for i=1:size(bbox,1)
    crop{i}=im2double(imcrop(img,bbox(i,:)));
    crop{i}=imresize(crop{i},[200 200]);
end
crop1=crop{1};
iter=40;
for i=1:length(crop)
    if i~=size(crop,2)
        new=crop{i+1}-crop{i};
        new=new./iter;
        for j=1:iter
            subplot(1,size(crop,2),i),imshow(crop{i});
            title(i);
            crop{i}=crop{i}+new;
            pause(0.1);
        end
    else
        new=crop1-crop{i};
        new=new./iter;
        for j=1:iter
            subplot(1,size(crop,2),i),imshow(crop{i});
            title(size(crop,2));
            crop{i}=crop{i}+new;
            pause(0.1);
        end
    end
end