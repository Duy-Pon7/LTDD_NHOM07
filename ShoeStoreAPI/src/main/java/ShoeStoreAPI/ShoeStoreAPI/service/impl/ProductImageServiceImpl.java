package ShoeStoreAPI.ShoeStoreAPI.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import ShoeStoreAPI.ShoeStoreAPI.entity.ProductImage;
import ShoeStoreAPI.ShoeStoreAPI.repository.ProductImageRepository;
import ShoeStoreAPI.ShoeStoreAPI.service.ProductImageService;

@Service
public class ProductImageServiceImpl implements ProductImageService{
	@Autowired
	ProductImageRepository productImageRepository;

	@Override
	public void save(ProductImage productImage) {
		productImageRepository.save(productImage);
	}

	@Override
	public void deleteById(int id) {
		productImageRepository.deleteById(id);
	}
	
	
}
