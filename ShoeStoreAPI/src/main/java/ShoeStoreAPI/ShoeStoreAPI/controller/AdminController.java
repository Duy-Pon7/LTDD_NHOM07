package ShoeStoreAPI.ShoeStoreAPI.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import ShoeStoreAPI.ShoeStoreAPI.entity.Category;
import ShoeStoreAPI.ShoeStoreAPI.entity.Order;
import ShoeStoreAPI.ShoeStoreAPI.entity.Order_Item;
import ShoeStoreAPI.ShoeStoreAPI.entity.Product;
import ShoeStoreAPI.ShoeStoreAPI.entity.ProductImage;
import ShoeStoreAPI.ShoeStoreAPI.entity.User;
import ShoeStoreAPI.ShoeStoreAPI.model.Mail;
import ShoeStoreAPI.ShoeStoreAPI.service.CategoryService;
import ShoeStoreAPI.ShoeStoreAPI.service.CloudinaryService;
import ShoeStoreAPI.ShoeStoreAPI.service.MailService;
import ShoeStoreAPI.ShoeStoreAPI.service.OrderService;
import ShoeStoreAPI.ShoeStoreAPI.service.Order_ItemService;
import ShoeStoreAPI.ShoeStoreAPI.service.ProductImageService;
import ShoeStoreAPI.ShoeStoreAPI.service.ProductService;
import ShoeStoreAPI.ShoeStoreAPI.service.UserService;

@Controller
public class AdminController {
	@Autowired
	OrderService orderService;

	@Autowired
	UserService userService;

	@Autowired
	ProductService productService;

	@Autowired
	CategoryService categoryService;

	@Autowired
	Order_ItemService order_ItemService;

	@Autowired
	CloudinaryService cloudinaryService;

	@Autowired
	MailService mailService;

	@Autowired
	HttpSession session;

	@Autowired
	ProductImageService productImageService;

	@GetMapping("/signin-admin")
	public String SignInAdminView(Model model) {
		String err_sign_admin = (String) session.getAttribute("err_sign_admin");
		model.addAttribute("err_sign_admin", err_sign_admin);
		session.setAttribute("err_sign_admin", null);
		return "signin-admin";
	}

	@PostMapping("/signin-admin")
	public String SignInAdminHandel(@ModelAttribute("login-name") String login_name,
			@ModelAttribute("pass") String pass, Model model) throws Exception {
		User admin = userService.findByIdAndRole(login_name, "admin");
		System.out.println(admin);
		if (admin == null) {
			session.setAttribute("err_sign_admin", "Username or Password is not correct!");
			return "redirect:/signin-admin";
		} else {
			String decodedValue = new String(Base64.getDecoder().decode(admin.getPassword()));
			if (!decodedValue.equals(pass)) {
				session.setAttribute("err_sign_admin", "Username or Password is not correct!");
				return "redirect:/signin-admin";
			} else {
				System.out.println(admin);
				session.setAttribute("admin", admin);
				return "redirect:/dashboard";
			}
		}
	}

	@GetMapping("/logout-admin")
	public String LogOutAdmin(Model model) {
		session.setAttribute("admin", null);
		return "redirect:/signin-admin";
	}

	@GetMapping("/dashboard")
	public String DashboardView(Model model) {
		User admin = (User) session.getAttribute("admin");
		System.out.println("======");
		if (admin == null) {
			return "redirect:/signin-admin";
		} else {
			List<Order> listOrder = orderService.findAll();
			List<Product> listProduct = productService.getAllProduct();
			List<User> listUser = userService.findAll();
			List<Category> listCategory = categoryService.findAll();

			model.addAttribute("Total_Order", listOrder.size());
			model.addAttribute("Total_Product", listProduct.size());
			model.addAttribute("Total_User", listUser.size());
			model.addAttribute("Total_Category", listCategory.size());
			return "dashboard";
		}
	}

	@GetMapping("/dashboard-invoice/{id}")
	public String InvoiceView(@PathVariable int id, Model model, HttpServletRequest request) {
		Order order = orderService.findById(id);
		List<Order_Item> listOrder_Item = order_ItemService.getAllByOrder_Id(order.getId());
		model.addAttribute("listOrder_Item", listOrder_Item);
		model.addAttribute("order", order);
		return "dashboard-invoice";
	}

	@GetMapping("/dashboard-orders")
	public String DashboardOrderView(Model model) {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/signin-admin";
		} else {
			Pageable pageable = PageRequest.of(0, 3);
			Page<Order> pageOrder = orderService.findAll(pageable);
			model.addAttribute("pageOrder", pageOrder);
			return "dashboard-orders";
		}
	}

	@GetMapping("/dashboard-orders/{page}")
	public String DashboardOrderPageView(@PathVariable int page, Model model) {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/signin-admin";
		} else {
			Pageable pageable = PageRequest.of(page, 3);
			Page<Order> pageOrder = orderService.findAll(pageable);
			model.addAttribute("pageOrder", pageOrder);
			return "dashboard-orders";
		}
	}

	@PostMapping("/send-message")
	public String SendMessage(Model model, @ModelAttribute("message") String message,
			@ModelAttribute("email") String email, HttpServletRequest request) throws Exception {
		String referer = request.getHeader("Referer");
		System.out.println(message);
		System.out.println(email);
		Mail mail = new Mail();
		mail.setMailFrom("phanduykiet29@gmail.com");
		mail.setMailTo(email);
		mail.setMailSubject("This is message from Shoe Store.");
		mail.setMailContent(message);
		mailService.sendEmail(mail);
		return "redirect:" + referer;
	}

	@GetMapping("/delete-order/{id}")
	public String DeleteOrder(@PathVariable int id, Model model, HttpServletRequest request) throws Exception {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/signin-admin";
		} else {
			String referer = request.getHeader("Referer");
			Order order = orderService.findById(id);
			System.out.println(order);
			if (order != null) {
				for (Order_Item y : order.getOrder_Item()) {
					order_ItemService.deleteById(y.getId());
				}
				orderService.deleteById(id);
			}
			return "redirect:" + referer;
		}
	}

	@GetMapping("dashboard-wallet")
	public String DashboardWalletView(Model model) {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/signin-admin";
		} else {
			List<Order> listOrder = orderService.findAll();
			List<Order> listPaymentWithMomo = orderService.findAllByPayment_Method("Pay with ZaloPay");
			List<Order> listPaymentOnDelivery = orderService.findAllByPayment_Method("Pay on Delivery");
			int TotalMomo = 0;
			int TotalDelivery = 0;
			for (Order y : listPaymentWithMomo) {
				TotalMomo = TotalMomo + y.getTotal();
			}
			for (Order y : listPaymentOnDelivery) {
				TotalDelivery = TotalDelivery + y.getTotal();
			}
			model.addAttribute("TotalMomo", TotalMomo);
			model.addAttribute("TotalDelivery", TotalDelivery);
			model.addAttribute("TotalOrder", listOrder.size());
			return "dashboard-wallet";
		}
	}
	
	@GetMapping("/redirect")
	public String Redirect(Model model, HttpServletRequest request) {
		String referer = request.getHeader("Referer");
		return "redirect:" + referer;
	}

	@PostMapping("/remove")
	public ResponseEntity<?> removeProduct(int id) {
		try {
			productService.deleteProductById(id);

			return ResponseEntity.ok(Map.of("success", true, "message", "Product added successfully"));
		} catch (Exception e) {
			return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR)
					.body(Map.of("success", false, "message", "Failed to add product"));
		}
	}

	@GetMapping("/product-manager")
	public String showProductList(Model model) {
		List<Product> productList = productService.getAllProduct();
		List<Category> categoryList = categoryService.findAll();
		model.addAttribute("products", productList);
		model.addAttribute("categories", categoryList);
		return "product-manager"; // phải có file templates/products.html
	}

	@GetMapping("/delete-product/{id}")
	public String DeleteProduct(@PathVariable int id, Model model, HttpServletRequest request) throws Exception {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/signin-admin";
		} else {
			String referer = request.getHeader("Referer");
			productService.deleteProductById(id);
			return "redirect:" + referer;
		}
	}

	@PostMapping("/add")
	public String AddProduct(@RequestParam("images") MultipartFile[] images, Product product, HttpServletRequest request) throws Exception {
		User admin = (User) session.getAttribute("admin");
		if (admin == null) {
			return "redirect:/signin-admin";
		} else {
			String referer = request.getHeader("Referer");
			product.setIs_Active(1);
			product.setIs_Selling(1);
			productService.saveProduct(product);
			List<String> imageUrls = new ArrayList<>();
			if (images != null && images.length > 0) {
				for (int i = 0; i < images.length && i < 4; i++) {
					String url = cloudinaryService.uploadFileProduct(images[i]);
					imageUrls.add(url);
					ProductImage productImage = new ProductImage();
					productImage.setUrl_Image(url);
					productImage.setProduct(product);
					productImageService.save(productImage);
				}
			}
			return "redirect:" + referer;
		}
	}
}
