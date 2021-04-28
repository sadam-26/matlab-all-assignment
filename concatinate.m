images = dir(['*.jpg']);
montage(cat(length({images.name}), {images.name}));