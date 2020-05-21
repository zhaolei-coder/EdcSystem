package com.edc.controller;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSON;
import com.alipay.api.AlipayApiException;
import com.alipay.api.AlipayClient;
import com.alipay.api.DefaultAlipayClient;
import com.alipay.api.internal.util.AlipaySignature;
import com.alipay.api.request.AlipayTradePagePayRequest;
import com.alipay.config.AlipayConfig;
import com.edc.entity.Buyer;
import com.edc.entity.BuyerAdd;
import com.edc.entity.Comment;
import com.edc.entity.Order;
import com.edc.entity.Product;
import com.edc.entity.ProductType;
import com.edc.entity.Seller;
import com.edc.entity.ShoppingCart;
import com.edc.entity.Viptype;
import com.edc.service.Prev_BuyerService;
import com.edc.util.CaptchaUtils;
import com.edc.util.EmailUtil;
import com.edc.util.Md5Utils;
import com.edc.util.PageUtil;

@Controller
@RequestMapping("/prev")
public class Prev_controller {

	private int userEmailCode = 0;

	@Resource
	private Prev_BuyerService prev_BuyerService;

	@RequestMapping("toLoginPage.do")
	public String toLogin() {
		return "prev_login";
	}

	// 去商品详情页面+评论
	@RequestMapping("to-ProductParticulars.do")
	public String toProductParticulars(HttpServletRequest request, @RequestParam("p_Id") int p_Id) {
		System.out.println(12345678);
		Map<String, Object> nb = new HashMap<String, Object>();
		Product product = prev_BuyerService.getProductId(p_Id);
		List<Comment> comment = prev_BuyerService.getCommentProId(p_Id);
		Integer saleCount = prev_BuyerService.sellectSaleCountBypId(p_Id);
		request.setAttribute("product", product);
		request.setAttribute("comment", comment);
		nb.put("product", product);
		nb.put("comment", comment);
		nb.put("saleCount", saleCount);
		request.setAttribute("nb", nb);
		return "prev_ProductParticulars";
	}

	@RequestMapping("to-ShopParticulars.do")
	public String toShopParticulars(Integer m_id, HttpServletRequest req) {
		Seller seller = prev_BuyerService.getSellerInfo(m_id);
		List<Product> twoProduct = prev_BuyerService.getTwoProductByShopId(m_id);
		req.setAttribute("seller", seller);
		req.setAttribute("twoPro", twoProduct);
		return "prev_ShopParticulars";
	}

	// 去前台登录
	@RequestMapping("to-prevLogin.do")
	public String toPrevLogin() {
		return "prev_login";
	}

	// 去商品列表2020-4-22
	@RequestMapping(value = "to-AllProduct.do", produces = "application/json; charset=utf-8")
	public String toAllProduct(HttpServletRequest request, String name) throws UnsupportedEncodingException {
		List<ProductType> productTypeList = prev_BuyerService.productTypeList();
		request.setAttribute("productTypeList", productTypeList);
		if (name == null || name == "") {
			request.setAttribute("name", "");
		} else {
			String Name = java.net.URLDecoder.decode(name, "utf-8");
			request.setAttribute("name", Name);
		}
		return "prev-AllProduct";
	}

	// 用户登录
	@RequestMapping("prewLogin.do")
	@ResponseBody
	public String prewLogin(HttpSession session, @RequestParam("a_code") String user,
			@RequestParam("a_pwd") String pwd) {
		Buyer buyer = prev_BuyerService.prevLogin(user);
		if (buyer != null) {
			if (Md5Utils.verify(pwd, buyer.getB_Pwd())) {
				session.setAttribute("prev", buyer);
				return "true";
			} else {
				return "false";
			}
		}
		return "false";
	}

	// 访问index
	@RequestMapping("index.do")
	public String index() {
		return "index";
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

	// 查询前台商品推荐
	@RequestMapping(value = "getSomeProduct.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getSomeProduct(HttpServletRequest req) {
		List<Product> someProduct = prev_BuyerService.getSomeProduct();
		String imgPath = req.getServletContext().getRealPath("/img");
		Map<String, Object> proMap = new HashMap<String, Object>();
		proMap.put("someProduct", someProduct);
		proMap.put("imgPath", imgPath);
		return JSON.toJSONString(proMap);
	}

	// 跳转到购物车页面
	@RequestMapping("to_prev_ShoppingTrolley.do")
	public String toShoppingTrolley(HttpSession session, HttpServletRequest req) {
		Buyer buyer = (Buyer) session.getAttribute("prev");
		if (buyer == null) {
			return "redirect:toLoginPage.do";
		} else {
			List<ShoppingCart> shoppingCartS = prev_BuyerService.getAllByBid(buyer.getB_Id());
			req.setAttribute("shoppingCartS", shoppingCartS);
			return "prev_ShoppingTrolley";
		}
	}

	// 查询所有商品
	// 商品详情分页 2020-4-17
	@RequestMapping(value = "getProductList.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getProductList(Integer pageIndex, String name, Integer pcId, Integer price) {
		PageUtil<Product> pageUtil = new PageUtil<Product>();
		if (pcId == null) {
			pcId = 0;
		}
		if (price == null) {
			price = -1;
		}
		pageUtil.setPageCount(prev_BuyerService.producCount(name, pcId, price));
		pageUtil.setPageIndex(pageIndex);
		pageUtil.setPageSize(15);
		List<Product> list = prev_BuyerService.productList(pageUtil.getPageIndex() * pageUtil.getPageSize(),
				pageUtil.getPageSize(), name, pcId, price);
		pageUtil.setPagelist(list);
		String jsonString = JSON.toJSONString(pageUtil);
		return jsonString;
	}

	// 跳转到订单提页面
	@RequestMapping("toSubmitOrder.do")
	public String toSubmitOrder(HttpSession session, HttpServletRequest request, @RequestParam("money") Double money,
			@RequestParam("ids") Integer[] ids) throws UnsupportedEncodingException {

		Buyer buyer = (Buyer) session.getAttribute("prev");
		List<ShoppingCart> shoppingCarts = new ArrayList<ShoppingCart>();
		if (buyer != null) {
			List<BuyerAdd> list = prev_BuyerService.getAllAddrBybid(buyer.getB_Id());
			request.setAttribute("addr", list);
			request.setAttribute("money", money);
			for (Integer id : ids) {
				shoppingCarts.add(prev_BuyerService.getAllByPid(id, buyer.getB_Id()));
			}
			session.setAttribute("buyIds", ids);
			request.setAttribute("shopList", shoppingCarts);
			return "prev_SubmitOrder";
		}
		return "redirect:toLoginPage.do";
	}

	// 主页推荐店铺2020-4-16 14:01:12
	@RequestMapping(value = "getSomeSeller.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String getSomeSeller(HttpServletRequest req) {
		List<Seller> someSeller = prev_BuyerService.getSomeSeller();
		return JSON.toJSONString(someSeller);
	}

	// 前台用户退出 2020-4-16
	@RequestMapping("exit.do")
	public void exitPrevLogin(HttpSession session, HttpServletResponse response, String path) throws IOException {
		session.removeAttribute("prev");
		response.sendRedirect(path);
	}

	@RequestMapping("to-prev_userInfo.do")
	public String toPrev_userInfo(HttpSession session, HttpServletRequest req) {
		Buyer buyer = (Buyer) session.getAttribute("prev");
		if (buyer == null) {
			return "redirect:toLoginPage.do";
		}
		List<Viptype> selectVip = prev_BuyerService.getSelectAll();
		List<Order> prevOrderList = prev_BuyerService.prevOrderList(buyer.getB_Id());
		List<Buyer> prevAddress = prev_BuyerService.prevAddress(buyer.getB_Id(), null);
		List<Comment> comments = prev_BuyerService.getCommentById(buyer.getB_Id());
		Integer selectShoppingCartCount = prev_BuyerService.selectShoppingCartCount(buyer.getB_Id());
		Integer selectOrderStateOk = prev_BuyerService.selectOrderStateOk(buyer.getB_Id());
		Integer selectOrderStateFalse = prev_BuyerService.selectOrderStateFalse(buyer.getB_Id());
		int[] in = { selectShoppingCartCount, prevOrderList.size(), comments.size(), selectOrderStateOk,
				selectOrderStateFalse };
		req.setAttribute("prevOrderList", prevOrderList);
		req.setAttribute("selectVip", selectVip);
		req.setAttribute("prevAddress", prevAddress);
		req.setAttribute("commentinfo", comments);
		req.setAttribute("in", in);
		return "prev_userInfo";
	}

	// 查询店铺中的所有商品并且分页显示
	@RequestMapping(value = "selectAllProductByShopId.do", produces = "application/json; charset=utf-8")
	@ResponseBody
	public String selectAllProductByShopId(Integer pageIndex, Integer shopId) {
		PageUtil<Product> pageUtil = new PageUtil<>();
		pageUtil.setPageCount(prev_BuyerService.getProductCountByShopId(shopId));
		pageUtil.setPageIndex(pageIndex);
		pageUtil.setPageSize(8);
		List<Product> list = prev_BuyerService.getAllProductByShopId(pageUtil.getPageIndex() * pageUtil.getPageSize(),
				pageUtil.getPageSize(), shopId);
		for (Product product : list) {
			System.out.println(product);
		}
		pageUtil.setPagelist(list);
		String jsonString = JSON.toJSONString(pageUtil);
		return jsonString;
	}

	// 去查询商品页面
	@RequestMapping(value = "toSelectSeller.do", produces = "application/json; charset=utf-8")
	public String toSelectProduct(HttpServletRequest req, String shopName) throws UnsupportedEncodingException {
		String Name = null;
		if (shopName != "" && shopName != null) {
			Name = java.net.URLDecoder.decode(shopName, "utf-8");
		}
		System.out.println(Name);
		List<Seller> sellerList = prev_BuyerService.getSellerLikeShopName(Name);
		System.out.println(sellerList);
		Integer count = prev_BuyerService.getSellerCountLikeShopName(Name);
		System.out.println(count);
		req.setAttribute("sellerList", sellerList);
		req.setAttribute("sellerCount", count);
		return "prev_to_selectSeller";
	}

	// 修改用户地址2020-4-20
	@RequestMapping("updateprevadd.do")
	@ResponseBody
	public String updateprevadd(HttpSession session, String bname, String address, String bphone) {
		Buyer buyer = (Buyer) session.getAttribute("prev");
		int updateBuyerAdd = prev_BuyerService.updateBuyerAdd(address, bname, buyer.getB_Id(), bphone);
		if (updateBuyerAdd == 1) {
			String jsonString = JSON.toJSONString(1);
			return jsonString;
		}
		return "0";
	}

	@RequestMapping("toRegister.do")
	public String toRegister() {
		return "prev_Register";
	}

	// 回显数据2020-4-21
	@RequestMapping("updateprevaddtext.do")
	@ResponseBody
	public String updateprevaddtext(HttpSession session, Integer addr_Id) {
		Buyer buyer = (Buyer) session.getAttribute("prev");
		List<Buyer> prevAddress = prev_BuyerService.prevAddress(buyer.getB_Id(), addr_Id);
		String jsonString = JSON.toJSONString(prevAddress);
		return jsonString;
	}

	// 修改用户信息2020-4-22
	@RequestMapping(value = "updateBuyer.do", method = RequestMethod.POST)
	public String updateBuyer(HttpServletRequest req, HttpSession session, Buyer buyer) {
		Buyer buyer1 = (Buyer) session.getAttribute("prev");
		// 获取上传文件
		//String fileName = file.getOriginalFilename();
		buyer.setB_ImgPath(buyer1.getB_ImgPath());
		buyer.setB_Id(buyer1.getB_Id());
		if (!buyer1.getB_Pwd().equals(buyer.getB_Pwd())) {
			String generate = Md5Utils.generate(buyer.getB_Pwd());
			buyer.setB_Pwd(generate);
		}
		int updateprev = prev_BuyerService.updateprev(buyer);
		if (updateprev > 0) {
			/*
			 * // 上传文件路径 // 上传的目标文件夹/file必须存在 String filePath =
			 * req.getServletContext().getRealPath("/SellerImg");
			 * System.out.println(filePath); try { // 获取文件上传的输入流 InputStream is =
			 * file.getInputStream(); // 创建文件输出�? OutputStream os = new FileOutputStream(new
			 * File(filePath, fileName)); // 读取写入 int len = 0; byte[] data = new byte[1024];
			 * while ((len = is.read(data)) != -1) { os.write(data, 0, len); } os.close();
			 * is.close(); } catch (IOException e) { e.printStackTrace(); }
			 */
			session.removeAttribute("prev");
			return "redirect:toLoginPage.do";
		} else {
			System.out.println("修改失败");
			return "redirect:to-prev_userInfo.do";
		}

	}

	// 用户注册2020年4月28日
	@ResponseBody
	@RequestMapping("saveBuyer.do")
	public String saveBuyer(HttpSession session, HttpServletRequest req, @RequestParam("b_Name") String b_Name,
			@RequestParam("b_Code") String b_Code, @RequestParam("b_Pwd") String b_Pwd,
			@RequestParam("b_Birthday") String b_Birthday, @RequestParam("b_Sex") String b_Sex,
			@RequestParam("b_Phone") String b_Phone, @RequestParam("buyerPath") MultipartFile file,
			@RequestParam("b_Email") String email, @RequestParam("backEmail") String backemail,
			@RequestParam("b_yz") String b_yz) throws Exception {
		System.out.println(b_yz);
		String fileName = file.getOriginalFilename();
		System.out.println(userEmailCode);
		int ImgCount = prev_BuyerService.getBuyerImgPath(fileName);
		Integer buyerCode = prev_BuyerService.getBuyerCode(b_Code);
		String email1 = email +backemail;
		Integer buyerEmail = prev_BuyerService.getBuyerEmail(email1);
		if (buyerCode > 0) {
			return "haveCode";
		} else if (buyerEmail > 0) {
			return "haveEmail";
		} else if (ImgCount == 1) {
			return "haveImg";
		} else {
			if (userEmailCode == Integer.parseInt(b_yz)) {
				Buyer buyer = new Buyer();
				buyer.setB_Name(b_Name);
				buyer.setB_Code(b_Code);
				buyer.setB_Pwd(Md5Utils.generate(b_Pwd));
				buyer.setB_Birthday(b_Birthday);
				buyer.setB_Sex(b_Sex);
				buyer.setB_Phone(b_Phone);
				buyer.setB_ImgPath(fileName);
				buyer.setEmail(email + backemail);// 邮箱
				System.out.println(buyer);
				// 文件上传
				String filePath = req.getServletContext().getRealPath("/BuyerImg");
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
				Integer saveBuyer = prev_BuyerService.saveBuyer(buyer);
				if (saveBuyer > 0) {
					return "true";
				} else {
					return "false";
				}

			} else {
				return "emailfalse";
			}
		}
	}

	// 接收邮箱验证码
	@ResponseBody
	@RequestMapping("getEmailCode.do")
	public String getEmailCode(HttpServletRequest req, @RequestParam("email") String userEmail)
			throws AddressException, MessagingException {
		userEmailCode = 0;
		int code = EmailUtil.sendEmailCode(userEmail);
		if (code != 0) {
			userEmailCode = code;
			return "true";
		}
		return "false";
	}

	/* 留言信息删除 */
	@RequestMapping("deleteCommentInfo.do")
	@ResponseBody
	public String deleteCommentInfo(Integer cid) {
		Integer count = prev_BuyerService.deleteCommentInfo(cid);
		if (count > 0) {
			return "true";
		}
		return "false";
	}

	/* 用户地址信息删除 2020-4-23 */
	@RequestMapping("deletePrevAddress.do")
	@ResponseBody
	public String deletePrevAddress(Integer prevAddId) {
		Integer count = prev_BuyerService.deletePrevAddress(prevAddId);
		if (count > 0) {
			return "true";
		}
		return "false";
	}

	@ResponseBody
	@RequestMapping("buyVip.do")
	public String buyVip(HttpSession session, Integer vid, Integer id) {
		Buyer buyer = (Buyer) session.getAttribute("prev");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String format2 = format.format(date);
		Integer count = prev_BuyerService.buyVip(id, vid, buyer.getB_Id(), format2);
		if (count > 0) {
			return "true";
		} else {
			return "false";
		}
	}

	@ResponseBody
	@RequestMapping("getThisVip.do")
	public String getThisVip(HttpSession session) {
		Buyer buyer = (Buyer) session.getAttribute("prev");
		Integer count = prev_BuyerService.selectUserIsVip(buyer.getB_Id());
		if (count > 0) {
			System.out.println("是会员");
			return "true";
		}
		return "false";
	}

	@RequestMapping("deleteShoppingTrolley.do")
	@ResponseBody
	public String deleteShoppingTrolley(Integer thisid) {
		System.out.println(thisid);
		Integer count = prev_BuyerService.deleteShoppingTrolley(thisid);
		System.out.println(count);
		if (count > 0) {
			return "true";
		}
		return "false";
	}

	// 添加购物车2020-4-24
	@RequestMapping("insertShoppingCart.do")
	@ResponseBody
	public String insertShoppingCart(HttpSession session, Integer shopCount, Integer p_Id, double p_Price) {
		Buyer buyer = (Buyer) session.getAttribute("prev");
		Integer count = prev_BuyerService.getProductById(buyer.getB_Id(), p_Id);
		if (count == 0) {
			ShoppingCart shoppingCart = new ShoppingCart();
			shoppingCart.setBuyerId(buyer.getB_Id());
			shoppingCart.setProductId(p_Id);
			shoppingCart.setShopCont(shopCount);
			double money = shopCount * p_Price;
			shoppingCart.setMoney(money);
			Integer insertShoppingCart = prev_BuyerService.insertShoppingCart(shoppingCart);
			if (insertShoppingCart > 0) {
				return "true";
			}
		} else {
			double money = shopCount * p_Price;
			Integer i = prev_BuyerService.updateProductCountById(shopCount, money, buyer.getB_Id(), p_Id);
			if (i > 0) {
				return "true";
			}
		}
		return "false";
	}

	/***
	 * 支付
	 * 
	 * @throws AlipayApiException
	 * @throws IOException
	 * @throws ServletException
	 * 
	 */
	@RequestMapping("Alipay.do")
	public void OrderPay(HttpServletRequest request, HttpServletResponse response,
			@RequestParam("WIDout_trade_no") String WIDout_trade_no,
			@RequestParam("WIDtotal_amount") Double WIDtotal_amount, @RequestParam("WIDsubject") String WIDsubject,
			@RequestParam("WIDbody") String WIDbody, @RequestParam("address") Integer address,
			@RequestParam("zhifu") Integer zhifu, @RequestParam("shopCont") Integer shopCont,
			@RequestParam("money") Double money) throws AlipayApiException, ServletException, IOException {
		Integer count = 0;
		Integer[] ids = (Integer[]) request.getSession().getAttribute("buyIds");
		Buyer buyer = (Buyer) request.getSession().getAttribute("prev");
		if (WIDout_trade_no != null) {
			request.getSession().setAttribute("out_trade_no", WIDout_trade_no);
		}
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		for (Integer id : ids) {
			Order order = new Order();
			order.setO_Count(shopCont);
			if (WIDbody != "" && WIDbody != null) {
				order.setO_Remark(WIDbody);
			}
			order.setO_TotalPrices(money);
			order.setO_ZftId(zhifu);
			order.setO_State("未支付");
			order.setO_Address(address);
			order.setO_OrderCode(WIDout_trade_no);
			order.setO_Pid(id);
			order.setO_Bid(buyer.getB_Id());
			order.setO_CreatDate(formatter.format(date));
			count = prev_BuyerService.addOrder(order);
		}

		// 获得初始化的AlipayClient
		AlipayClient alipayClient = new DefaultAlipayClient(AlipayConfig.gatewayUrl, AlipayConfig.app_id,
				AlipayConfig.merchant_private_key, "json", AlipayConfig.charset, AlipayConfig.alipay_public_key,
				AlipayConfig.sign_type);
		// 设置请求参数
		AlipayTradePagePayRequest alipayRequest = new AlipayTradePagePayRequest();
		alipayRequest.setReturnUrl(AlipayConfig.return_url);
		alipayRequest.setNotifyUrl(AlipayConfig.notify_url);

		// 商户订单号，商户网站订单系统中唯一订单号，必填
		String out_trade_no = WIDout_trade_no;
		// 付款金额，必填
		String total_amount = WIDtotal_amount.toString();
		// 订单名称，必填
		String subject = WIDsubject;
		// 商品描述，可空
		String body = WIDbody;
		alipayRequest.setBizContent("{\"out_trade_no\":\"" + out_trade_no + "\"," + "\"total_amount\":\"" + total_amount
				+ "\"," + "\"subject\":\"" + subject + "\"," + "\"body\":\"" + body + "\","
				+ "\"product_code\":\"FAST_INSTANT_TRADE_PAY\"}");
		// 请求
		String result = alipayClient.pageExecute(alipayRequest).getBody();
		if (count > 0) {
			// 输出
			response.setContentType("text/html;charset=" + AlipayConfig.charset);
			response.getWriter().write(result);
			response.getWriter().flush();
			response.getWriter().close();
		}

	}

	/***
	 * 支付成功
	 * 
	 * @throws AlipayApiException
	 * @throws UnsupportedEncodingException
	 */
	@RequestMapping("ok.do")
	public String buyOk(HttpServletRequest request) throws AlipayApiException, UnsupportedEncodingException {
		/*
		 * * 功能：支付宝服务器同步通知页面 日期：2017-03-30 说明：
		 * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
		 * 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
		 ************************* 
		 * 
		 * 页面功能说明************************* 该页面仅做页面展示，业务逻辑处理请勿在该页面执行
		 */
		// 获取支付宝GET过来反馈信息
		Map<String, String> params = new HashMap<String, String>();
		Map<String, String[]> requestParams = request.getParameterMap();
		for (Iterator<String> iter = requestParams.keySet().iterator(); iter.hasNext();) {
			String name = (String) iter.next();
			String[] values = (String[]) requestParams.get(name);
			String valueStr = "";
			for (int i = 0; i < values.length; i++) {
				valueStr = (i == values.length - 1) ? valueStr + values[i] : valueStr + values[i] + ",";
			}
			// 乱码解决，这段代码在出现乱码时使用
			valueStr = new String(valueStr.getBytes("ISO-8859-1"), "utf-8");
			params.put(name, valueStr);
		}
		boolean signVerified = AlipaySignature.rsaCheckV1(params, AlipayConfig.alipay_public_key, AlipayConfig.charset,
				AlipayConfig.sign_type); // 调用SDK验证签名
		// ——请在这里编写您的程序（以下代码仅作参考）——
		if (signVerified) {
			System.out.println("支付成功");
			// 商户订单号
			String out_trade_no = new String(request.getParameter("out_trade_no").getBytes("ISO-8859-1"), "UTF-8");

			// 支付宝交易号
			String trade_no = new String(request.getParameter("trade_no").getBytes("ISO-8859-1"), "UTF-8");

			// 付款金额
			String total_amount = new String(request.getParameter("total_amount").getBytes("ISO-8859-1"), "UTF-8");

			Integer[] ids = (Integer[]) request.getSession().getAttribute("buyIds");
			Buyer buyer = (Buyer) request.getSession().getAttribute("prev");
			//String out_trade_no = (String) request.getSession().getAttribute("out_trade_no");
			for (Integer id : ids) {
				System.out.println(id);
				prev_BuyerService.updateState(out_trade_no, "已完成");
				prev_BuyerService.delShopCartById(id, buyer.getB_Id());
			}
			//request.getSession().removeAttribute("out_trade_no");
			request.getSession().removeAttribute("buyIds");

			return "redirect:to_prev_ShoppingTrolley.do";
		} else {
			System.out.println("支付失败");
		}
		return "redirect:to_prev_ShoppingTrolley.do";
	}

	@RequestMapping("selectCommentCount.do")
	@ResponseBody
	public String selectCommentCount(HttpServletRequest request, Integer pId) {
		System.out.println("商品Id" + pId);
		Buyer buyer = (Buyer) request.getSession().getAttribute("prev");
		Integer count = prev_BuyerService.selectCommentCountByBid(buyer.getB_Id(), pId);
		if (count > 0) {
			return "true";
		} else {
			return "false";
		}

	}

	@RequestMapping("addComment.do")
	@ResponseBody
	public String addComment(HttpServletRequest request, Integer pId, String commentText) {
		Buyer buyer = (Buyer) request.getSession().getAttribute("prev");
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		Date date = new Date();
		String format2 = format.format(date);
		System.out.println("商品Id" + pId);
		System.out.println(commentText);
		Comment comment = new Comment();
		comment.setC_Bid(buyer.getB_Id());
		comment.setC_Content(commentText);
		comment.setC_Date(format2);
		comment.setC_Pid(pId);
		Integer count = prev_BuyerService.addComment(comment);
		if (count > 0) {
			return "true";
		} else {
			return "false";
		}
	}

	@RequestMapping("addAddress.do")
	@ResponseBody
	public String addAddress(HttpServletRequest request, String addr) {
		Buyer buyer = (Buyer) request.getSession().getAttribute("prev");
		BuyerAdd baddr = new BuyerAdd();
		baddr.setAddr_Bid(buyer.getB_Id());
		baddr.setAddress(addr);
		Integer addaddr = prev_BuyerService.addaddr(baddr);
		if (addaddr > 0) {
			return "true";
		} else {
			return "false";
		}

	}

}
