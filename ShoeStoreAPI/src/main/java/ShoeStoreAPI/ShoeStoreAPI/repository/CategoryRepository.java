package ShoeStoreAPI.ShoeStoreAPI.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import ShoeStoreAPI.ShoeStoreAPI.entity.Category;

public interface CategoryRepository extends JpaRepository<Category,Long> {
	
	Category getById(int id);

}
