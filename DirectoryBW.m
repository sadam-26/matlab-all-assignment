outputDir = 'tobw/';% after processing all the jpg images will be stored into png format in this directory
 
loadJPG = dir(['*.jpg']); % it loads all the files into variable loadJPG
 
for i=1:length(loadJPG)
    img = imread([loadJPG(i).name]); 
    name = loadJPG(i).name; 
    fprintf('%d) loading %s \t', i, name);
    img = im2bw(img);
    imwrite(img, [outputDir name]);
    fprintf('%d) writing %s  \n', i, name);
 end