package com.edc.mapper.impl;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class Prev_BuyerMapperImpl extends SqlSessionDaoSupport implements Prev_BuyerMapper {

	@Autowired
	@Override
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	@Override
	public Buyer prevLogin(String name) {
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).prevLogin(name);
	}

	@Override
	public List<Product> getSomeProduct() {
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).getSomeProduct();
	}

	// 查询所有商品类型
	@Override
	public List<ProductType> productTypeList() {
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).productTypeList();
	}

	// 2020-4-17
	public List<Product> productList(Integer pageIndex, Integer pageSize, String name, Integer pcId, Integer price) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).productList(pageIndex, pageSize, name, pcId,
				price);
	}

	// 2020-4-17
	public Integer producCount(String name, Integer pcId, Integer price) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).producCount(name, pcId, price);
	}

	@Override
	public List<Seller> getSomeSeller() {
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).getSomeSeller();
	}

	@Override
	public Seller getSellerInfo(Integer shopId) {
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).getSellerInfo(shopId);
	}

	@Override
	public List<Product> getTwoProductByShopId(Integer shopId) {
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).getTwoProductByShopId(shopId);
	}

	@Override
	public Product getProductId(int p_Id) {
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).getProductId(p_Id);
	}

	@Override
	public List<Product> getAllProductByShopId(Integer pageIndex, Integer pageSize, Integer shopId) {
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).getAllProductByShopId(pageIndex, pageSize,
				shopId);
	}

	@Override
	public Integer getProductCountByShopId(Integer shopId) {
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).getProductCountByShopId(shopId);
	}

	@Override
	public List<Comment> getCommentProId(int p_Id) {
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).getCommentProId(p_Id);
	}

	// 查询登录用户订单信息2020-4-20
	public List<Order> prevOrderList(int b_id) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).prevOrderList(b_id);
	}

	public int updateBuyer(String b_Name, int b_id, String b_phone) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).updateBuyer(b_Name, b_id, b_phone);
	}

	public int updateBuyerAdd(String address, int b_id) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).updateBuyerAdd(address, b_id);
	}

	@Override
	public List<Buyer> prevAddress(int b_id, Integer Addr_Id) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).prevAddress(b_id, Addr_Id);
	}

	@Override
	public int updateprev(Buyer buyer) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).updateprev(buyer);
	}

	@Override
	public List<Viptype> getSelectAll() {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).getSelectAll();
	}

	@Override
	public List<Comment> getCommentById(int c_Bid) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).getCommentById(c_Bid);
	}

	@Override
	public List<Seller> getSellerLikeShopName(String shopName) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).getSellerLikeShopName(shopName);
	}

	@Override
	public Integer getSellerCountLikeShopName(String shopName) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).getSellerCountLikeShopName(shopName);
	}

	@Override
	public Integer saveBuyer(Buyer buyer) {
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).saveBuyer(buyer);
	}

	@Override
	public Integer getBuyerImgPath(String ImgName) {
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).getBuyerImgPath(ImgName);
	}

	@Override
	public Integer deleteCommentInfo(Integer c_Id) {
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).deleteCommentInfo(c_Id);
	}

	@Override
	public Integer deletePrevAddress(Integer prevAddId) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).deletePrevAddress(prevAddId);
	}

	@Override
	public Integer selectShoppingCartCount(Integer buyerId) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).selectShoppingCartCount(buyerId);
	}

	@Override
	public Integer buyVip(Integer id, Integer vid, Integer bid, String date) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).buyVip(id, vid, bid, date);
	}

	@Override
	public Integer selectUserIsVip(Integer bid) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).selectUserIsVip(bid);
	}

	@Override
	public List<ShoppingCart> getAllByBid(Integer bid) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).getAllByBid(bid);
	}

	@Override
	public Integer deleteShoppingTrolley(Integer id) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).deleteShoppingTrolley(id);
	}

	@Override
	public List<BuyerAdd> getAllAddrBybid(Integer bid) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).getAllAddrBybid(bid);
	}

	@Override
	public Integer insertShoppingCart(ShoppingCart shoppingCart) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).insertShoppingCart(shoppingCart);
	}

	// 查询要添加的商品存不存在
	public Integer getProductById(@Param("buyerId") Integer buyerId, @Param("productId") Integer productId) {
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).getProductById(buyerId, productId);
	}

	@Override
	public Integer updateProductCountById(Integer count, Double money, Integer buyerId, Integer productId) {
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).updateProductCountById(count, money, buyerId,
				productId);
	}

	@Override
	public ShoppingCart getAllByPid(Integer pid, Integer bid) {
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).getAllByPid(pid, bid);
	};

	@Override
	public Integer addOrder(Order order) {
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).addOrder(order);
	}

	@Override
	public Integer updateState(String out_trade_no, String state) {
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).updateState(out_trade_no, state);
	}

	@Override
	public Integer delShopCartById(Integer pid, Integer bid) {
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).delShopCartById(pid, bid);
	}

	@Override
	public Integer selectCommentCountByBid(Integer bid, Integer pid) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).selectCommentCountByBid(bid, pid);
	}

	@Override
	public Integer addComment(Comment comment) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).addComment(comment);
	}

	@Override
	public Integer selectOrderStateOk(Integer bid) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).selectOrderStateOk(bid);
	}

	@Override
	public Integer selectOrderStateFalse(Integer bid) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).selectOrderStateFalse(bid);
	}

	@Override
	public Integer getBuyerCode(String bcode) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).getBuyerCode(bcode);
	}

	@Override
	public Integer getBuyerEmail(String email) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).getBuyerEmail(email);
	}

	@Override
	public Integer addaddr(BuyerAdd addr) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).addaddr(addr);
	}

	@Override
	public Integer sellectSaleCountBypId(Integer pid) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Prev_BuyerMapper.class).sellectSaleCountBypId(pid);
	}
}
