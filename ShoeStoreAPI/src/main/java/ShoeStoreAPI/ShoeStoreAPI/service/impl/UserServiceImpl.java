package ShoeStoreAPI.ShoeStoreAPI.service.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import ShoeStoreAPI.ShoeStoreAPI.entity.User;
import ShoeStoreAPI.ShoeStoreAPI.repository.UserRepository;
import ShoeStoreAPI.ShoeStoreAPI.service.UserService;

@Service
public class UserServiceImpl implements UserService{

	@Autowired
	SessionFactory factory;
	
	private UserRepository userRepository;
	public UserServiceImpl(UserRepository userRepository) {
		super();
		this.userRepository=userRepository;
	}
	@Override
	public List<User> getAllUser() {
		// TODO Auto-generated method stub
		return userRepository.findAll();
	}

	@Override
	public User saveUser(User user) {
		// TODO Auto-generated method stub
		return userRepository.save(user);
	}

	@Override
	public User updateUser(User user) {
		// TODO Auto-generated method stub
		return userRepository.save(user);
	}

	@Override
	public void deleteUserById(String id) {
		// TODO Auto-generated method stub
		userRepository.deleteById(id);
	}
	@Override
	public User GetUserByEmail(String email) {
		// TODO Auto-generated method stub
		return userRepository.findByEmail(email);
	}
	@Override
	public User findByIdAndRole(String id, String role) {
		return userRepository.findByIdAndRole(id, role);
	}
	@Override
	public List<User> findAll() {
		return userRepository.findAll();
	}
	
	
}
