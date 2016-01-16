train_x = csvread('training_inputs.csv');

vectorize_patch = zeros(194,3600);

patch_size=50;

%% here the patches are 60 X 60 in an image of 193 X 193 

for i=1:194
    reshap_train_x = reshape(train_x(i,:),193,193);
    image_patch = reshap_train_x(71:130,71:130);
    vectorize_patch(i,:) = reshape(image_patch,1,3600);
end

for i = 1:20
     subplot(4,5,i);
     imshow(reshape(vectorize_patch(i,:),60,60));
end

csvwrite('patch_data.csv',vectorize_patch);


for i = 1:20
     subplot(4,5,i);
     imshow(reshape(feature1(:,i),25,32));
end


%plot features 
figure
subplot(1,3,1)
imshow(feature1(1:60,1:60))
title('feature1')
subplot(1,3,2)
imshow(feature2(1:60,1:60))
title('feature1')
subplot(1,3,3)
imshow(feature3(1:60,1:60))
title('feature1')












