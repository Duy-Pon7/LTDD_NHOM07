package ShoeStoreAPI.ShoeStoreAPI.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import ShoeStoreAPI.ShoeStoreAPI.entity.ProductImage;

public interface ProductImageRepository extends JpaRepository<ProductImage,Integer>{

	void deleteById(int id);

}
