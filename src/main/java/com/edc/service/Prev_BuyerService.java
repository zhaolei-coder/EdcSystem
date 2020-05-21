package com.edc.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.edc.entity.Buyer;
import com.edc.entity.BuyerAdd;
import com.edc.entity.Comment;
import com.edc.entity.Order;
import com.edc.entity.Product;
import com.edc.entity.ProductType;
import com.edc.entity.Seller;
import com.edc.entity.ShoppingCart;
import com.edc.entity.Viptype;

public interface Prev_BuyerService {
	public Buyer prevLogin(String buyerName);

	// 查询前台商品推荐
	public List<Product> getSomeProduct();

	// 饭菜分类显示的类型
	public List<ProductType> productTypeList();

	// 饭菜商品详情 2020-4-17
	public List<Product> productList(Integer pageIndex, Integer pageSize, String name, Integer pcId, Integer price);

	// 饭菜商品数量2020-4-17
	public Integer producCount(String name, Integer pcId, Integer price);

	// 获取推荐商家
	public List<Seller> getSomeSeller();

	// 查询商家信息
	public Seller getSellerInfo(Integer shopId);

	// 查询店铺中推荐的两道商品
	public List<Product> getTwoProductByShopId(Integer shopId);

	// 商品详情
	public Product getProductId(int p_Id);

	// 查询店铺中的所有商品并且分页显示
	public List<Product> getAllProductByShopId(@Param("pageIndex") Integer pageIndex,
			@Param("pageSize") Integer pageSize, @Param("shopId") Integer shopId);

	// 查询店铺中的所有商品数量
	public Integer getProductCountByShopId(Integer shopId);

	// 商品评价
	public List<Comment> getCommentProId(@Param("p_Id") int p_Id);

	// 查询登录用户订单信息2020-4-20
	public List<Order> prevOrderList(@Param("b_id") int b_id);

	// 查询登录用户收货地址信息2020-4-20
	public List<Buyer> prevAddress(int b_id, Integer Addr_Id);

	// 修改用户地址信息2020-4-20
	public int updateBuyerAdd(String address, String b_Name, int b_id, String b_phone);

	// 修改用户地址信息2020-4-21
	public int updateprev(@Param("buyer") Buyer buyer);

	// 查询所有会员类型
	public List<Viptype> getSelectAll();

	// 查询留言信息2020-4-21
	public List<Comment> getCommentById(@Param("c_Bid") int c_Bid);

	// 模糊查询店铺
	public List<Seller> getSellerLikeShopName(@Param("shopName") String shopName);

	// 模糊查询店铺数量
	public Integer getSellerCountLikeShopName(@Param("shopName") String shopName);

	// 前台注册页面
	Integer saveBuyer(Buyer buyer);

	// 查询图片是否重名
	public Integer getBuyerImgPath(String ImgName);

	// 删除留言信息2020-4-22
	public Integer deleteCommentInfo(Integer c_Id);

	// 删除用户地址信息2020-4-23
	public Integer deletePrevAddress(Integer prevAddId);

	// 查询用户购物车数量2020-4-23
	public Integer selectShoppingCartCount(Integer buyerId);

	// 查询当前用户是否是会员2020-4-22 17:03:17
	public Integer selectUserIsVip(Integer bid);

	// 购买会员
	public Integer buyVip(@Param("id") Integer id, @Param("vid") Integer vid, @Param("bid") Integer bid,
			@Param("date") String date);

	// 前台购物车渲染
	public List<ShoppingCart> getAllByBid(@Param("bid") Integer bid);

	// 删除购物车商品
	public Integer deleteShoppingTrolley(@Param("id") Integer id);

	// 获取当前用户的收货地址
	public List<BuyerAdd> getAllAddrBybid(@Param("bid") Integer bid);

	// 添加购物车
	public Integer insertShoppingCart(ShoppingCart shoppingCart);

	// 查询要添加的商品存不存在
	public Integer getProductById(@Param("buyerId") Integer buyerId, @Param("productId") Integer productId);

	/***
	 * 如果商品存在的情况下 , 就修改商品的个数
	 */
	public Integer updateProductCountById(@Param("count") Integer count, @Param("money") Double money,
			@Param("buyerId") Integer buyerId, @Param("productId") Integer productId);

	/***
	 * 查询用户提交订单时选中的商品
	 */
	public ShoppingCart getAllByPid(@Param("pid") Integer pid, @Param("bid") Integer bid);

	public Integer addOrder(Order order);

	/***
	 * 修改订单状态
	 */
	public Integer updateState(@Param("out_trade_no") String out_trade_no, @Param("state") String state);

	/***
	 * 删除已完成的购物车信息
	 */
	public Integer delShopCartById(@Param("pid") Integer pid, @Param("bid") Integer bid);

	/**
	 * 查询该用户是否评论过该商品
	 */
	public Integer selectCommentCountByBid(@Param("bid") Integer bid, @Param("pid") Integer pid);

	/**
	 * 添加评论
	 * 
	 * @param comment
	 * @return
	 */
	public Integer addComment(Comment comment);

	/**
	 * 查询已完成的订单
	 */
	public Integer selectOrderStateOk(Integer bid);

	/**
	 * 查询未完成的订单
	 */
	public Integer selectOrderStateFalse(Integer bid);

	/**
	 * 注册时查询有没有重复账号2020-4-28
	 */
	public Integer getBuyerCode(String bcode);

	/**
	 * 注册时查询有没有重复邮箱2020-4-28
	 */
	public Integer getBuyerEmail(String email);

	/**
	 * 添加地址
	 */
	public Integer addaddr(BuyerAdd addr);

	/**
	 * 查询商品月销量
	 */
	public Integer sellectSaleCountBypId(Integer pid);
}
