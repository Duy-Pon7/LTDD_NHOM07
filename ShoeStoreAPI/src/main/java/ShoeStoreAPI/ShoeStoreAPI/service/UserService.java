package ShoeStoreAPI.ShoeStoreAPI.service;

import java.util.List;

import ShoeStoreAPI.ShoeStoreAPI.entity.User;

public interface UserService {
	List<User> getAllUser();

	User saveUser(User user);

	User updateUser(User user);

	void deleteUserById(String id);
	
	User GetUserByEmail(String email);

	User findByIdAndRole(String id, String role);

	List<User> findAll();    
}
