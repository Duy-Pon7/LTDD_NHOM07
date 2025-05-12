package ShoeStoreAPI.ShoeStoreAPI.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import ShoeStoreAPI.ShoeStoreAPI.entity.Order_Item;

public interface Order_ItemRepository extends JpaRepository<Order_Item,Integer>{

	List<Order_Item> findAllByOrder_id(int id);

	void deleteById(int id);
	
}
