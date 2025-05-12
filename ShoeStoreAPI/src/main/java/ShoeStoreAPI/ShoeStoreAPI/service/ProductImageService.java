package ShoeStoreAPI.ShoeStoreAPI.service;

import ShoeStoreAPI.ShoeStoreAPI.entity.ProductImage;

public interface ProductImageService {

	void save(ProductImage productImage);

	void deleteById(int id);

}
