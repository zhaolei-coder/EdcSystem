package com.edc.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.edc.entity.Buyer;
import com.edc.entity.BuyerAdd;
import com.edc.entity.Comment;
import com.edc.entity.Order;
import com.edc.entity.Product;
import com.edc.entity.ProductType;
import com.edc.entity.Seller;
import com.edc.entity.ShoppingCart;
import com.edc.entity.Viptype;
import com.edc.mapper.Prev_BuyerMapper;
import com.edc.service.Prev_BuyerService;
import com.edc.util.Md5Utils;

@Service
public class Prev_BuyerServiceImpl implements Prev_BuyerService {

	private Prev_BuyerMapper prev_BuyerMapper;

	@Autowired
	public void setPrev_BuyerMapper(Prev_BuyerMapper prev_BuyerMapper) {
		this.prev_BuyerMapper = prev_BuyerMapper;
	}

	public Buyer prevLogin(String buyerName) {
		return prev_BuyerMapper.prevLogin(buyerName);
	}

	@Override
	public List<Product> getSomeProduct() {
		return prev_BuyerMapper.getSomeProduct();
	}

	// 饭菜分类显示的类型
	@Override
	public List<ProductType> productTypeList() {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.productTypeList();
	}

	// 2020-4-17
	public List<Product> productList(Integer pageIndex, Integer pageSize, String name, Integer pcId, Integer price) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.productList(pageIndex, pageSize, name, pcId, price);
	}

	// 2020-4-17
	public Integer producCount(String name, Integer pcId, Integer price) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.producCount(name, pcId, price);
	}

	@Override
	public List<Seller> getSomeSeller() {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.getSomeSeller();
	}

	@Override
	public Seller getSellerInfo(Integer shopId) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.getSellerInfo(shopId);
	}

	@Override
	public List<Product> getTwoProductByShopId(Integer shopId) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.getTwoProductByShopId(shopId);
	}

	@Override
	public Product getProductId(int p_Id) {
		System.out.println(p_Id);
		return prev_BuyerMapper.getProductId(p_Id);
	}

	@Override
	public List<Product> getAllProductByShopId(Integer pageIndex, Integer pageSize, Integer shopId) {
		return prev_BuyerMapper.getAllProductByShopId(pageIndex, pageSize, shopId);
	}

	@Override
	public Integer getProductCountByShopId(Integer shopId) {
		return prev_BuyerMapper.getProductCountByShopId(shopId);
	}

	@Override
	public List<Comment> getCommentProId(int p_Id) {
		return prev_BuyerMapper.getCommentProId(p_Id);
	}

	// 查询登录用户订单信息2020-4-20
	public List<Order> prevOrderList(int b_id) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.prevOrderList(b_id);
	}

	public List<Buyer> prevAddress(int b_id, Integer Addr_Id) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.prevAddress(b_id, Addr_Id);
	}

	public int updateBuyerAdd(String address, String b_Name, int b_id, String b_phone) {
		// TODO Auto-generated method stub
		int updateBuyer = prev_BuyerMapper.updateBuyer(b_Name, b_id, b_phone);
		int updateBuyerAdd = prev_BuyerMapper.updateBuyerAdd(address, b_id);
		if (updateBuyer == 1 && updateBuyerAdd == 1) {
			return 1;
		}
		return 0;
	}

	@Override
	public int updateprev(Buyer buyer) {

		return prev_BuyerMapper.updateprev(buyer);
	}

	@Override
	public List<Viptype> getSelectAll() {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.getSelectAll();
	}

	@Override
	public List<Comment> getCommentById(int c_Bid) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.getCommentById(c_Bid);
	}

	@Override
	public List<Seller> getSellerLikeShopName(String shopName) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.getSellerLikeShopName(shopName);
	}

	@Override
	public Integer getSellerCountLikeShopName(String shopName) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.getSellerCountLikeShopName(shopName);
	}

	@Override
	public Integer saveBuyer(Buyer buyer) {
		return prev_BuyerMapper.saveBuyer(buyer);
	}

	@Override
	public Integer getBuyerImgPath(String ImgName) {
		return prev_BuyerMapper.getBuyerImgPath(ImgName);
	}

	@Override
	public Integer deleteCommentInfo(Integer c_Id) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.deleteCommentInfo(c_Id);
	}

	@Override
	public Integer deletePrevAddress(Integer prevAddId) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.deletePrevAddress(prevAddId);
	}

	@Override
	public Integer selectShoppingCartCount(Integer buyerId) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.selectShoppingCartCount(buyerId);
	}

	@Override
	public Integer selectUserIsVip(Integer bid) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.selectUserIsVip(bid);
	}

	@Override
	public Integer buyVip(Integer id, Integer vid, Integer bid, String date) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.buyVip(id, vid, bid, date);
	}

	@Override
	public List<ShoppingCart> getAllByBid(Integer bid) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.getAllByBid(bid);
	}

	@Override
	public Integer deleteShoppingTrolley(Integer id) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.deleteShoppingTrolley(id);
	}

	@Override
	public List<BuyerAdd> getAllAddrBybid(Integer bid) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.getAllAddrBybid(bid);
	}

	@Override
	public Integer insertShoppingCart(ShoppingCart shoppingCart) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.insertShoppingCart(shoppingCart);
	}

	@Override
	public Integer getProductById(Integer buyerId, Integer productId) {
		return prev_BuyerMapper.getProductById(buyerId, productId);
	}

	@Override
	public Integer updateProductCountById(Integer count, Double money, Integer buyerId, Integer productId) {
		return prev_BuyerMapper.updateProductCountById(count, money, buyerId, productId);
	}

	@Override
	public ShoppingCart getAllByPid(Integer pid, Integer bid) {
		return prev_BuyerMapper.getAllByPid(pid, bid);
	}

	@Override
	public Integer addOrder(Order order) {
		return prev_BuyerMapper.addOrder(order);
	}

	@Override
	public Integer updateState(String out_trade_no, String state) {
		return prev_BuyerMapper.updateState(out_trade_no, state);
	}

	@Override
	public Integer delShopCartById(Integer pid, Integer bid) {
		return prev_BuyerMapper.delShopCartById(pid, bid);
	}

	@Override
	public Integer selectCommentCountByBid(Integer bid, Integer pid) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.selectCommentCountByBid(bid, pid);
	}

	@Override
	public Integer addComment(Comment comment) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.addComment(comment);
	}

	@Override
	public Integer selectOrderStateOk(Integer bid) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.selectOrderStateOk(bid);
	}

	@Override
	public Integer selectOrderStateFalse(Integer bid) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.selectOrderStateFalse(bid);
	}

	@Override
	public Integer getBuyerCode(String bcode) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.getBuyerCode(bcode);
	}

	@Override
	public Integer getBuyerEmail(String email) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.getBuyerEmail(email);
	}

	@Override
	public Integer addaddr(BuyerAdd addr) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.addaddr(addr);
	}

	@Override
	public Integer sellectSaleCountBypId(Integer pid) {
		// TODO Auto-generated method stub
		return prev_BuyerMapper.sellectSaleCountBypId(pid);
	}
}
