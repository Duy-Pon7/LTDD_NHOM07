package ShoeStoreAPI.ShoeStoreAPI.service;

import java.util.List;

import ShoeStoreAPI.ShoeStoreAPI.entity.Cart;
import ShoeStoreAPI.ShoeStoreAPI.entity.Product;

public interface CartService {
	
	void deleteById(int id);
	
	List<Cart> GetAllCartByUser_id(String user_id);
	
	Cart saveCart(Cart cart);
	
	int getProductByCartId(int cart_id);
	
}
