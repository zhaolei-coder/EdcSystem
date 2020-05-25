package com.edc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.edc.entity.Admin;
import com.edc.entity.Buyer;
import com.edc.entity.Product;
import com.edc.entity.ProductType;
import com.edc.entity.Seller;
import com.edc.service.Back_AdminService;
import com.edc.util.CaptchaUtils;
import com.edc.util.Md5Utils;
import com.edc.util.PageUtil;
/***
 * 后台
 * @author zhaolei
 *
 */
@Controller
@RequestMapping("/back")
public class Back_controller {
	@Autowired
	private Back_AdminService edcBackService;

	// 访问登录页面
	@RequestMapping("login.do")
	public String login() {
		return "login";
	}

	@ResponseBody
	@RequestMapping("adminLogin.do")
	// 用户登录
	public String adminLogin(HttpSession session, @RequestParam("userName") String adminName,
			@RequestParam("passWord") String pwd) {
		Admin admin = edcBackService.userlogin(adminName);
		// 判断用户是否存在
		if (admin != null) {
			if (Md5Utils.verify(pwd, admin.getA_pwd())) {
				session.setAttribute("admin", admin);
				return "true";
			} else {
				return "false";
			}
		}
		return "false";
	}

	@RequestMapping("register.do")
	public String register() {
		return "register";
	}

	// 访问index
	@RequestMapping("index.do")
	public String welcome() {
		return "index";
	}

	// 跳转到seller-list.jsp
	@RequestMapping("to-seller-list.do")
	public String toSeller() {
		return "seller-list";
	}

	// 跳转到product-list.jsp
	@RequestMapping("to-product-list.do")
	public String toProduct() {
		return "product-list";
	}

	// 跳转到seller-delete.jsp
	@RequestMapping("to-seller-delete.do")
	public String toSellerDelete() {
		return "seller-delete";
	}

	// 查询所有的商家信息
	@RequestMapping(value = "seller-list.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String order_list(HttpServletRequest request, Integer pageIndex, String userName,
			HttpServletResponse response) {
		PageUtil<Seller> pageUtil = new PageUtil<Seller>();
		pageUtil.setPageCount(edcBackService.getSellerCount(userName));
		pageUtil.setPageIndex(pageIndex);
		pageUtil.setPageSize(10);
		List<Seller> seller = edcBackService.getAllSeller(pageUtil.getPageIndex() * pageUtil.getPageSize(),
				pageUtil.getPageSize(), userName);
		pageUtil.setPagelist(seller);
		String jsonString = JSON.toJSONString(pageUtil);
		return jsonString;
	}

	// 访问welcome.do
	@RequestMapping("welcome.do")
	public String welcomePage() {
		return "welcome";
	}

	// 获取验证码
	@RequestMapping("loadimg.do")
	public void loadImg(HttpServletRequest request, HttpServletResponse response) {
		try {
			CaptchaUtils.getImage(request, response);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 判断用户输入的验证码是否正确
	@RequestMapping("checkCode.do")
	@ResponseBody
	public String check(HttpSession session, String inputCode) {
		String code = (String) session.getAttribute("codeValue");
		if (inputCode.toLowerCase().equals(code.toLowerCase())) {
			return "true";
		} else {
			return "false";
		}
	}

	// 退出系统
	@RequestMapping("exit.do")
	public String exitLogin(HttpSession session) {
		session.removeAttribute("admin");
		session.removeAttribute("seller");
		return "redirect:login.do";
	}

	// 跳转vipUser-list页面
	@RequestMapping("to-vipUser-list.do")
	public String toVipUserList() {
		return "vipUser-list";
	}

	// 获取会员信息
	@RequestMapping(value = "getAllVipUsers.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getAllVipUser(Integer pageIndex, String name) {
		PageUtil<Buyer> pageUtil = new PageUtil<>();
		pageUtil.setPageCount(edcBackService.getVipUserCount(name));
		System.out.println("name" + name);
		System.out.println("sdas" + edcBackService.getVipUserCount(name));
		pageUtil.setPageIndex(pageIndex);
		pageUtil.setPageSize(10);
		List<Buyer> list = edcBackService.getAllVipUsers(pageUtil.getPageIndex() * pageUtil.getPageSize(),
				pageUtil.getPageSize(), name);
		System.out.println(list);
		pageUtil.setPagelist(list);
		return JSON.toJSONString(pageUtil);
	}

	// 删除商家信息
	@RequestMapping("deleteSeller.do")
	@ResponseBody
	public String deleteSeller(Integer sid) {
		Integer did = edcBackService.deleteSeller(sid);
		if (did > 0) {
			return "success";
		} else {
			return "error";
		}

	}

	@ResponseBody
	@RequestMapping("sellerLogin.do")
	public String sellerLogin(HttpSession session, @RequestParam("userName") String sellerName,
			@RequestParam("passWord") String pwd) {
		Seller seller = edcBackService.sellerLogin(sellerName);
		if (seller != null) {
			/**
			 * md5加密判断写在这
			 */
			if (pwd.equals(seller.getM_Pwd())) {
				System.out.println(seller);
				session.setAttribute("seller", seller);
				return "true";
			} else {
				return "false";
			}
		}
		return "false";
	}

	// 查询所有的商品信息
	@RequestMapping(value = "productlist.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String productList(HttpServletRequest request, Integer pageIndex, String proName, Integer sid,
			HttpServletResponse response) {
		System.out.println(proName);
		PageUtil<Product> pageUtil = new PageUtil<Product>();
		pageUtil.setPageCount(edcBackService.getProductCount(proName, sid));
		pageUtil.setPageIndex(pageIndex);
		pageUtil.setPageSize(5);
		List<Product> product = edcBackService.getAllproduct(pageUtil.getPageIndex() * pageUtil.getPageSize(),
				pageUtil.getPageSize(), proName, sid);
		pageUtil.setPagelist(product);
		String jsonString = JSON.toJSONString(pageUtil);
		return jsonString;
	}

	// 删除商品信息
	@RequestMapping("deleteProduct.do")
	@ResponseBody
	public String deleteProduct(Integer pid) {
		System.out.println(pid);
		Integer did = edcBackService.deleteProduct2(pid);
		System.out.println(did);
		if (did > 0) {
			return "success";
		} else {
			return "error";
		}

	}

	@RequestMapping("toproadd.do")
	public String toproadd() {
		return "productAdd";
	}

	// 删除会员信息
	@RequestMapping("delete-vipuser.do")
	@ResponseBody
	public String deleteVipuser(int vipid, HttpServletResponse response) {
		Integer deleteVipuser = edcBackService.deleteVipuser(vipid);
		String jsonString = null;
		jsonString = JSON.toJSONString(deleteVipuser);
		return jsonString;
	}

	@RequestMapping("toProductAdd.do")
	public String toProductAdd() {
		return "productAdd";
	}

	// 获取商品类型2020-4-14 14:32:58
	@RequestMapping(value = "getproducttype.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getAllProductType() {
		List<ProductType> proTypeList = edcBackService.selectAllProductType();
		String jsonString = JSON.toJSONString(proTypeList);
		return jsonString;
	}

	/**
	 * @商家注册
	 */
	@ResponseBody
	@RequestMapping("saveSeller.do")
	public String sellRegister(HttpSession session, HttpServletRequest req, @RequestParam("m_Name") String m_Name,
			@RequestParam("m_ShopName") String m_ShopName, @RequestParam("m_Code") String m_Code,
			@RequestParam("m_Pwd") String m_Pwd, @RequestParam("m_Phone") String m_Phone,
			@RequestParam("m_Address") String m_Address, @RequestParam("m_BusinessHours") String m_BusinessHours,
			@RequestParam("m_imgPath") MultipartFile file) throws Exception {
		String fileName = file.getOriginalFilename();
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date(); //
		Seller seller = new Seller();
		// seller.setCreateDate(formatter.format(date));// 创建当前时间
		seller.setM_Name(m_Name);
		seller.setM_Code(m_Code);
		seller.setM_Pwd(m_Pwd);
		seller.setM_ShopName(m_ShopName);
		seller.setM_Phone(m_Phone);
		seller.setM_imgPath(fileName);
		// 前台数据
		seller.setCreateDate(formatter.format(date));
		seller.setMdifyDate(formatter.format(date));
		seller.setM_Address(m_Address);
		seller.setM_BusinessHours(m_BusinessHours);
		// 文件上传
		String filePath = req.getServletContext().getRealPath("/SellerImg");
		System.out.println(filePath);
		InputStream is = file.getInputStream();
		OutputStream os = new FileOutputStream(new File(filePath, fileName));
		int len = 0;
		byte[] data = new byte[1024];
		while ((len = is.read(data)) != -1) {
			os.write(data, 0, len);
		}
		os.close();
		is.close();
		Integer sellerNum = edcBackService.saveSeller(seller); // 判断添加成功否
		if (sellerNum > 0) {
			System.out.println("注册成功！！");
			return "1";
		}
		return "2";
	}

	@RequestMapping("saveProduct.do")
	public String saveProduct(HttpSession session, HttpServletRequest req, Product product,
			@RequestParam("p_imgPath") MultipartFile file) throws IOException {
		String fileName = file.getOriginalFilename();
		Seller seller = (Seller) session.getAttribute("seller");
		System.out.println(product);
		product.setP_Mid(seller.getM_Id());
		product.setP_ImgPath(fileName);
		Integer sellerNum = edcBackService.saveProduct(product);// 判断添加成功否
		if (sellerNum > 0) {
			// 文件上传
			String filePath = req.getServletContext().getRealPath("/productImg");
			String servletPath = req.getServletPath();
			System.out.println(servletPath);
			System.out.println(filePath);
			InputStream is = file.getInputStream();
			OutputStream os = new FileOutputStream(new File(filePath, fileName));
			int len = 0;
			byte[] data = new byte[1024];
			while ((len = is.read(data)) != -1) {
				os.write(data, 0, len);
			}
			os.close();
			is.close();
			return "redirect:to-product-list.do";
		}
		return "to-product-list.do";
	}

	@RequestMapping("toUpdatePro.do")
	public String updateProduct(Integer pid, HttpServletRequest req) {
		Product pro = edcBackService.getProductByPid(pid);
		System.out.println(pro);
		req.setAttribute("pro", pro);
		List<ProductType> productTypeList = edcBackService.selectAllProductType();
		req.setAttribute("productTypeList", productTypeList);
		return "productUpdate";
	}

	@ResponseBody
	@RequestMapping("updateProduct.do")
	public String updateProduct(HttpSession session, HttpServletRequest req, @RequestParam("P_Name") String P_Name,
			@RequestParam("P_Id") Integer P_Id, @RequestParam("P_Price") Double P_Price,
			@RequestParam("P_Good") Integer P_Good, @RequestParam("P_Count") Integer P_Count,
			@RequestParam("P_mId") Integer P_mId, @RequestParam("P_pcId") Integer P_pcId,
			@RequestParam("P_Info") String P_Info, @RequestParam("p_imgPath") MultipartFile file) throws IOException {

		String fileName = file.getOriginalFilename();
		System.out.println(fileName);
		Product product = null;
		Product pro = new Product();
		if (fileName == "") {
			product = edcBackService.getProductByPid(P_Id);
			pro.setP_ImgPath(product.getP_ImgPath());
		} else {
			// 文件上传
			String filePath = req.getServletContext().getRealPath("/productImg");
			pro.setP_ImgPath(fileName);
			InputStream is = file.getInputStream();
			OutputStream os = new FileOutputStream(new File(filePath, fileName));
			int len = 0;
			byte[] data = new byte[1024];
			while ((len = is.read(data)) != -1) {
				os.write(data, 0, len);
			}
			os.close();
			is.close();
		}
		pro.setP_Id(P_Id);
		pro.setP_Count(P_Count);
		pro.setP_Good(P_Good);

		pro.setP_Info(P_Info);
		pro.setP_Mid(P_mId);
		pro.setP_Name(P_Name);
		pro.setP_pcId(P_pcId);
		pro.setP_Price(P_Price);
		System.out.println("haha" + pro);

		Integer updateNum = edcBackService.updateProduct(pro);// 判断添加成功否
		if (updateNum > 0) {
			System.out.println("修改成功！！");
			return "1";
		}
		return "2";
	}

	// 111111111111111111111111111111111111111111111111111111111111111111111111111111111111111
	@RequestMapping("toUpdateSeller.do")
	public String toUpdateSeller(HttpServletRequest req) {
		Seller seller = (Seller) req.getSession().getAttribute("seller");
		Seller sellerInfo = edcBackService.getSellerInfo(seller.getM_Id());
		System.out.println(sellerInfo);
		req.setAttribute("seller", sellerInfo);
		return "sellerUpdate";
	}

	@RequestMapping("updateSeller.do")
	public String updateSeller(HttpServletRequest req, Seller seller, @RequestParam("file") MultipartFile file) {
		Date date = new Date();
		Seller seller2 = (Seller) req.getSession().getAttribute("seller");
		System.out.println(seller2);
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		String fileName = file.getOriginalFilename();
		if (fileName != "" && fileName != null) {
			seller.setM_imgPath(fileName);
			String filePath = req.getServletContext().getRealPath("/SellerImg");
			try {
				// 获取文件上传的输入流
				InputStream is = file.getInputStream();
				// 创建文件输出�?
				OutputStream os = new FileOutputStream(new File(filePath, fileName));
				// 读取写入
				int len = 0;
				byte[] data = new byte[1024];
				while ((len = is.read(data)) != -1) {
					os.write(data, 0, len);
				}
				os.close();
				is.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			seller.setM_imgPath(seller2.getM_imgPath());
		}
		seller.setMdifyDate(formatter.format(date));
		Integer updateSeller = edcBackService.updateSeller(seller);
		if (updateSeller > 0) {
			req.getSession().removeAttribute("seller");
			return "redirect:login.do";
		} else {
			System.out.println("修改失败");
			return "redirect:toUpdateSeller.do";
		}
	}

}
