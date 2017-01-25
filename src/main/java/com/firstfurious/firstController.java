package com.firstfurious;


import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.authentication.logout.SecurityContextLogoutHandler;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.annotation.ModelAndViewResolver;

import com.firstfurious.cart.Cart;
import com.firstfurious.cart.CartDAO;
import com.firstfurious.category.Category;
import com.firstfurious.category.CategoryDAO;
import com.firstfurious.product.Product;
import com.firstfurious.product.ProductDAO;
import com.firstfurious.user.User;
import com.firstfurious.user.UserDAO;
import com.firstfurious.userRole.UserRoleDAO;
import com.google.gson.Gson;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

@Controller
public class firstController{
	
	@Autowired
	CategoryDAO cdao;
	@Autowired
	ProductDAO pdao;
	@Autowired
	UserDAO udao;
	@Autowired
	UserRoleDAO urdao;
	@Autowired
	CartDAO crdao;
	@Autowired
	JavaMailSender mail;
	
	
	@Autowired
	ServletContext context;
	
	public String test() {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null && !auth.getName().equals("anonymousUser")) {
			System.out.println(auth.getName());
			// System.out.println("User present");
			return "false";
		} else {
			System.out.println("User not present");
			return "true";
		}
		

	}

	@RequestMapping("/")
	public ModelAndView index(){
		//request handler method
		urdao.generateUserRoles();
		ModelAndView model = home();
		return model;
	}
	
	@RequestMapping("/index")
	public ModelAndView home(){
		//request handler method

		ModelAndView model = new ModelAndView("index");
		List<Category> list = cdao.getCategory();
		
		List<Product> brandList = pdao.getProduct();
		
		JSONArray jarr = new JSONArray();
		
		/*for(Product p:brandList){
				JSONObject jobj = new JSONObject();
				jobj.put("id",p.getpId());
				
				jarr.add(jobj);
				}
			System.out.println(jarr.toJSONString());
		*/
		
			
		String catList = new Gson().toJson(list);

		String brand = new Gson().toJson(brandList);
		model.addObject("catList",catList);
		model.addObject("brand",brand);
		
		System.out.println(brandList);
		System.out.println(brand);
		return model;
	}
	
	@RequestMapping("/head-meta")
	public String head_meta(){
		return "head-meta";
	}
	
	@RequestMapping("/head")
	public String head(){
		return "head";
	}
	
	@RequestMapping("/foot")
	public String foot(){
		return "foot";
	}
	
	@RequestMapping("/aboutus")
	public ModelAndView about(){
		ModelAndView model = new ModelAndView("aboutUs");
		return model;	
	}
	
	@RequestMapping("/contactus")
	public ModelAndView contact(){
		ModelAndView model = new ModelAndView("contactUs");
		return model;
	}
	
	
	//Category Section
	
	@RequestMapping("/allCategories")
	public ModelAndView allCategories(){
		ModelAndView mav = new ModelAndView("allCategories");
		
		JSONArray jarr= new JSONArray();
		List<Category> list = cdao.getCategory();
		System.out.println(list);
		for(Category c:list )
		{
			JSONObject jobj = new JSONObject();
			
			jobj.put("CategoryId", c.getcId() );
			jobj.put("CategoryName", c.getcName());
			
			jarr.add(jobj);
		}
		
		mav.addObject("Categories", jarr.toJSONString());
		
		return mav;                                                                 
	}
	
	@RequestMapping("/addCategory")
	public ModelAndView addCategory(){
		ModelAndView model = new ModelAndView("addCategory");
		model.addObject("Category", new Category());
		return model;
	}
	
	@RequestMapping(value="/AddCategoryToDB" , method=RequestMethod.POST)
	public String AddCategoryToDB( @ModelAttribute("Category") Category c ){
				
		//System.out.println(c.getcName());
		cdao.insert(c);
		
		return "redirect:/allCategories";
	}
	
	@RequestMapping("/DeleteCategoryFromDB/{cId}")
	public String DeleteCategory(@PathVariable("cId") int cId){
		
		
		Category c = cdao.getCategory(cId);
		cdao.delete(cId);
		
		List<Product> list = pdao.getProduct();
		for(Product p : list){
			if(p.getpCategory().equals(c.getcName())){
				p.setpCategory("-");
				pdao.update(p);
			}
		}
		
		return "redirect:/allCategories";
	}
	
	@RequestMapping("/updatecategory/{cid}")
	public ModelAndView updatecategory(  @PathVariable("cid") int cid ) {
		ModelAndView mav = new ModelAndView("updateCategory");
		Category c = cdao.getCategory(cid);
		
		System.out.println(cid);
		
		mav.addObject("Category", c);
		return mav;
	}
	
	@RequestMapping(value="/UpdateCategoryToDB" , method=RequestMethod.POST)
	public String UpdateCategoryToDB( @ModelAttribute("Category") Category c ) {
		
		Category cOld = cdao.getCategory(c.getcId());
		
		cdao.update(c);
		
		List<Product> list = pdao.getProduct();
		
		for(Product p : list ){
			if(p.getpCategory().equals(cOld.getcName())){
				p.setpCategory(c.getcName());
				pdao.update(p);
			}
		}
		
		return "redirect:/allCategories";
	}	
	
	
	//Product Section
	
	@RequestMapping("/allProducts")
	public ModelAndView allProducts(){
		ModelAndView mav = new ModelAndView("allProducts");
		
		
		List<Product> list = pdao.getProduct();
		System.out.println(list);
		String pList = new Gson().toJson(list);
		System.out.println();
		mav.addObject("Products",pList);
		return mav;
	}
	
	@RequestMapping("/productsbycategory/{cName}")
	public ModelAndView listProductByCategory(@PathVariable("cName") String cName){
		
		ModelAndView mav = new ModelAndView("allProducts");
		
		List<Product> list = pdao.getProductByCategoryName(cName);
		
		String catList = new Gson().toJson(list);
		mav.addObject("Products",catList);
		System.out.println(catList);
		
		return mav;	
	}
	
	@RequestMapping("/productbybrand/{pBrand}")
	public ModelAndView listProductsByBrand(@PathVariable("pBrand") String pBrands){
		
		ModelAndView mav = new ModelAndView("allProducts");
		
		List<Product> list = pdao.getProductByBrandName(pBrands);
		
		String brandList = new Gson().toJson(list);
		mav.addObject("Products",brandList);
		
		return mav;	
	}
	
	
	
	
	@RequestMapping("/addProduct")
	public ModelAndView addProducts(){
		ModelAndView mav = new ModelAndView("addProduct");
		mav.addObject("Product", new Product());
		
		List<Category> list = cdao.getCategory();
		mav.addObject("AllCategories",list);
		
		return mav;
	}
	
	@RequestMapping(value="/AddProductToDB" , method=RequestMethod.POST)
	public String AddProductToDB( @ModelAttribute("Product") Product p,HttpServletRequest request ){
		
		/*System.out.println(p.getpName());*/
		pdao.insert(p);
		
		Product i1 = pdao.getProductWithMaxId();

		System.out.println(i1.getpId());

		try {
			String path = context.getRealPath("/");

			System.out.println(path);

			File directory = null;

			// System.out.println(ps.getProductWithMaxId());

			if (p.getProductFile().getContentType().contains("image")) {
				directory = new File(path + "\\resources\\images");

				System.out.println(directory);

				byte[] bytes = null;
				File file = null;
				bytes = p.getProductFile().getBytes();

				if (!directory.exists())
					directory.mkdirs();

				file = new File(directory.getAbsolutePath() + System.getProperty("file.separator") + "image_"
						+ i1.getpId() + ".jpg");

				System.out.println(file.getAbsolutePath());

				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(file));
				stream.write(bytes);
				stream.close();
				
				//for logo upload
				byte[] bytes2 = null;
				bytes2= p.getBrandLogo().getBytes();
				String path2 = request.getSession().getServletContext().getRealPath("/resources/images/" + p.getpId() + ".jpg");
				System.out.println("Path ="+path);
				System.out.println("File name = " + p.getBrandLogo().getOriginalFilename());
				File f = new File(path2);
				BufferedOutputStream bs = new BufferedOutputStream(new FileOutputStream(f));
				bs.write(bytes2);
				bs.close();
				System.out.println("file uploaded");

			}

			i1.setpImage("resources/images/image_" + i1.getpId() + ".jpg");

			pdao.update(i1);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "redirect:/allProducts";
	}
	
	@RequestMapping("/DeleteProductFromDB/{pId}")
	public String DeleteProduct(@PathVariable("pId") int pId){
		pdao.delete(pId);
		return "redirect:/allProducts";
	}
	
	@RequestMapping("/updateproduct/{pid}")
	public ModelAndView updateproduct(  @PathVariable("pid") int pid ) {
		ModelAndView mav = new ModelAndView("updateProduct");
		Product p = pdao.getProduct(pid);
		
		//System.out.println(pid);
		//System.out.println(p);
		
		mav.addObject("Product", p);
		
		List<Category> list = cdao.getCategory();
		mav.addObject("AllCategories",list);
		
		return mav;
	}
	
	@RequestMapping(value="/UpdateProductToDB" , method=RequestMethod.POST)
	public String UpdateProductToDB( @ModelAttribute("Product") Product p ) {
		
		try {
			String path = context.getRealPath("/");

			System.out.println(path);

			File directory = null;

			// System.out.println(ps.getProductWithMaxId());

			if (p.getProductFile().getContentType().contains("image")) {
				directory = new File(path + "\\resources\\images");

				System.out.println(directory);

				byte[] bytes = null;
				File file = null;
				bytes = p.getProductFile().getBytes();

				if (!directory.exists())
					directory.mkdirs();

				file = new File(directory.getAbsolutePath() + System.getProperty("file.separator") + "image_"
						+ p.getpId() + ".jpg");

				System.out.println(file.getAbsolutePath());

				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(file));
				stream.write(bytes);
				stream.close();

			}

			p.setpImage("resources/images/image_" + p.getpId() + ".jpg");

			pdao.update(p);
		} catch (Exception e) {
			e.printStackTrace();
		}

		
		return "redirect:/allProducts";
	}	
	
	//Sign Up Section
	
	@RequestMapping("/signup")
	public ModelAndView signup(){
		ModelAndView model = new ModelAndView("signUp");
		model.addObject("User", new User());
		return model;
	}
	
	@RequestMapping(value="/AddUserToDB" , method=RequestMethod.POST)
	public ModelAndView AddUserToDB(@Valid @ModelAttribute("User") User user, BindingResult bind) {
		
		ModelAndView mav = new ModelAndView("signUp");

		System.out.println("In User Insert");

		if (bind.hasErrors()) {
			mav.addObject("User", user);
		} else {
			if (user.getuPassword().equals(user.getuCPassword())) {
				List<User> list = udao.getAllUsers();

				System.out.println(list);

				boolean usermatch = false;

				for (User u : list) {
					if (u.getuName().equals(user.getuName())) {
						usermatch = true;
						break;
					}
				}

				if (usermatch == false) {
					String password = user.getuPassword();
					BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
					String hashedPassword = passwordEncoder.encode(password);
					System.out.println(hashedPassword);
					user.setuPassword(hashedPassword);
					
					udao.insertUser(user);

					mav.addObject("User", new User());

					mav.addObject("success", "success");
				} else {
					mav.addObject("User", user);

					mav.addObject("useralreadyexists", "useralreadyexists");
				}
			} else {
				mav.addObject("User", user);

				mav.addObject("passwordmismatch", "passwordmismatch");
			}

		}
		
		return mav;
	}
	
	//Login Section
	
	@RequestMapping(value="/loginpage", method = RequestMethod.GET)
	public ModelAndView login(){
		ModelAndView model = new ModelAndView("login");
		return model;
	}
	
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logoutPage(HttpServletRequest request, HttpServletResponse response) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null) 
		{

			System.out.println("In LogOut");
			new SecurityContextLogoutHandler().logout(request, response, auth);

		}

		return "login";
	}
	
	
	@RequestMapping(value = "/initiateFlow", method = RequestMethod.GET)
	public String redirect(HttpServletRequest request) {

		String retval = "";

		if (request.getUserPrincipal() == null)
			retval = "redirect:/cart?user=none";
		else
			retval = "redirect:/cart?user=" + request.getUserPrincipal().getName();

		return retval;
	}
	
	@RequestMapping(value = "/view/{productID}")
	public ModelAndView addproduct1(@PathVariable("productID") int prodid) {
		ModelAndView mav = new ModelAndView("view");

		System.out.println(prodid);

		Product p = pdao.getProduct(prodid);

		if (p != null) {

			mav.addObject("ProductName", p.getpName());
			mav.addObject("ProductDescription", p.getpDescription());
			mav.addObject("ProductCategory", p.getpCategory());
			mav.addObject("ProductBrand",p.getpBrand());
			mav.addObject("ProductPrice", p.getpPrice());
			mav.addObject("ProductQty", p.getpQuantity());
			mav.addObject("ProductImg", p.getpImage());
			mav.addObject("ProductId", p.getpId());
		
		}

		return mav;
	
		}
	
	
	
	@RequestMapping(value = "/addToCart")
	public String addToCart(HttpServletRequest request) {

		Authentication auth = SecurityContextHolder.getContext().getAuthentication();
		if (auth != null && !auth.getName().equals("anonymousUser")) {
			System.out.println(request.getParameter("pid"));
			System.out.println(request.getParameter("pqty"));

			int qty = 1;
			
			
			Cart cd = crdao.getCartBypId(Integer.parseInt(request.getParameter("pid")));
			
			
			qty = Integer.parseInt(request.getParameter("pqty"));
			

			try {
				

				if (!(qty >= 1 && qty <= 10))
					throw new Exception();
			} catch (Exception e) {
				System.out.println("Invalid Qty");
			}
			
			
			if(cd!=null){
				String checkQuantity = cd.getQty();
				cd.setQty(String.valueOf(Integer.parseInt(checkQuantity)+qty));
				crdao.update(cd);
			}
			else{

			Cart c = new Cart();

			c.setProductID(request.getParameter("pid"));
			c.setQty("" + qty);

			Product p = pdao.getProduct(Integer.parseInt(request.getParameter("pid")));

			c.setName(p.getpName());
			c.setPrice(p.getpPrice());

			c.setUserName(auth.getName());

			crdao.add(c);
			}
			
			Product productQunantity = pdao.getProduct(Integer.parseInt(request.getParameter("pid")));
			String quan = productQunantity.getpQuantity();
			productQunantity.setpQuantity(String.valueOf(Integer.parseInt(quan)-qty));
			pdao.update(productQunantity);

		}

		return "redirect:initiateFlow";

		}
	
	
	@RequestMapping(value="/sendQuery" , method = RequestMethod.POST)
	public String sendQuery( HttpServletRequest req , HttpServletResponse resp ) {

		String uname = req.getParameter("name");
		String uemail = req.getParameter("email");
		String subject = req.getParameter("subject");
		String msg = req.getParameter("message");
		
		System.out.println( uemail );
		System.out.println( subject );
		System.out.println( msg );

		SimpleMailMessage email = new SimpleMailMessage();
		
		email.setFrom("firstfurious95@gmail.com");
		email.setTo("kkchaudhary11@gmail.com");
		email.setSubject(uemail+":"+subject);
		email.setText(uname+":"+msg);

		try
		{
			mail.send(email);
			
			System.out.println("Mail 1 Sent");
		}
		catch(Exception e)
		{
			e.printStackTrace();
		}
		

		String uemail1 = req.getParameter("email");


		System.out.println( uemail1 );
		
		
		email.setTo(uemail1);
		email.setSubject("Welcome to FirstFurious");
		email.setText(" Thanks for Contacting Us \n We will get back to you soon \n\n Regards, \n The Krystal Watches Team");
		
		
	
		
		
		return "redirect:/contactus";
	}
	
	
}