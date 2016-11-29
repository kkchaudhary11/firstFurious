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
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
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

import com.firstfurious.category.Category;
import com.firstfurious.category.CategoryDAO;
import com.firstfurious.product.Product;
import com.firstfurious.product.ProductDAO;
import com.firstfurious.user.User;
import com.firstfurious.user.UserDAO;
import com.firstfurious.userRole.UserRoleDAO;

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
	ServletContext context;
	
	@RequestMapping("/")
	public ModelAndView index(){
		//request handler method
		urdao.generateUserRoles();
		ModelAndView model = new ModelAndView("index");
		return model;
	}
	
	@RequestMapping("/index")
	public ModelAndView home(){
		//request handler method

		ModelAndView model = new ModelAndView("index");
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
		
		JSONArray jarr = new JSONArray();
		List<Product> list = pdao.getProduct();
		System.out.println(list);
		for(Product p:list){
			JSONObject jobj = new JSONObject();
			
			jobj.put("ProductId", p.getpId());
			jobj.put("ProductName", p.getpName());
			jobj.put("ProductCategory", p.getpCategory());
			jobj.put("ProductDescription", p.getpDescription());
			jobj.put("ProductQuantity", p.getpQuantity());
			jobj.put("ProductPrice", p.getpPrice());
			jobj.put("flag", p.getpImage());
			jarr.add(jobj);
		}
		mav.addObject("Products", jarr.toJSONString());
		System.out.println(jarr.toJSONString());
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
	public String AddProductToDB( @ModelAttribute("Product") Product p ){
		
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

	
}