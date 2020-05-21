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

	// ��ѯǰ̨��Ʒ�Ƽ�
	public List<Product> getSomeProduct();

	// ���˷�����ʾ������
	public List<ProductType> productTypeList();

	// ������Ʒ���� 2020-4-17
	public List<Product> productList(Integer pageIndex, Integer pageSize, String name, Integer pcId, Integer price);

	// ������Ʒ����2020-4-17
	public Integer producCount(String name, Integer pcId, Integer price);

	// ��ȡ�Ƽ��̼�
	public List<Seller> getSomeSeller();

	// ��ѯ�̼���Ϣ
	public Seller getSellerInfo(Integer shopId);

	// ��ѯ�������Ƽ���������Ʒ
	public List<Product> getTwoProductByShopId(Integer shopId);

	// ��Ʒ����
	public Product getProductId(int p_Id);

	// ��ѯ�����е�������Ʒ���ҷ�ҳ��ʾ
	public List<Product> getAllProductByShopId(@Param("pageIndex") Integer pageIndex,
			@Param("pageSize") Integer pageSize, @Param("shopId") Integer shopId);

	// ��ѯ�����е�������Ʒ����
	public Integer getProductCountByShopId(Integer shopId);

	// ��Ʒ����
	public List<Comment> getCommentProId(@Param("p_Id") int p_Id);

	// ��ѯ��¼�û�������Ϣ2020-4-20
	public List<Order> prevOrderList(@Param("b_id") int b_id);

	// ��ѯ��¼�û��ջ���ַ��Ϣ2020-4-20
	public List<Buyer> prevAddress(int b_id, Integer Addr_Id);

	// �޸��û���ַ��Ϣ2020-4-20
	public int updateBuyerAdd(String address, String b_Name, int b_id, String b_phone);

	// �޸��û���ַ��Ϣ2020-4-21
	public int updateprev(@Param("buyer") Buyer buyer);

	// ��ѯ���л�Ա����
	public List<Viptype> getSelectAll();

	// ��ѯ������Ϣ2020-4-21
	public List<Comment> getCommentById(@Param("c_Bid") int c_Bid);

	// ģ����ѯ����
	public List<Seller> getSellerLikeShopName(@Param("shopName") String shopName);

	// ģ����ѯ��������
	public Integer getSellerCountLikeShopName(@Param("shopName") String shopName);

	// ǰ̨ע��ҳ��
	Integer saveBuyer(Buyer buyer);

	// ��ѯͼƬ�Ƿ�����
	public Integer getBuyerImgPath(String ImgName);

	// ɾ��������Ϣ2020-4-22
	public Integer deleteCommentInfo(Integer c_Id);

	// ɾ���û���ַ��Ϣ2020-4-23
	public Integer deletePrevAddress(Integer prevAddId);

	// ��ѯ�û����ﳵ����2020-4-23
	public Integer selectShoppingCartCount(Integer buyerId);

	// ��ѯ��ǰ�û��Ƿ��ǻ�Ա2020-4-22 17:03:17
	public Integer selectUserIsVip(Integer bid);

	// �����Ա
	public Integer buyVip(@Param("id") Integer id, @Param("vid") Integer vid, @Param("bid") Integer bid,
			@Param("date") String date);

	// ǰ̨���ﳵ��Ⱦ
	public List<ShoppingCart> getAllByBid(@Param("bid") Integer bid);

	// ɾ�����ﳵ��Ʒ
	public Integer deleteShoppingTrolley(@Param("id") Integer id);

	// ��ȡ��ǰ�û����ջ���ַ
	public List<BuyerAdd> getAllAddrBybid(@Param("bid") Integer bid);

	// ��ӹ��ﳵ
	public Integer insertShoppingCart(ShoppingCart shoppingCart);

	// ��ѯҪ��ӵ���Ʒ�治����
	public Integer getProductById(@Param("buyerId") Integer buyerId, @Param("productId") Integer productId);

	/***
	 * �����Ʒ���ڵ������ , ���޸���Ʒ�ĸ���
	 */
	public Integer updateProductCountById(@Param("count") Integer count, @Param("money") Double money,
			@Param("buyerId") Integer buyerId, @Param("productId") Integer productId);

	/***
	 * ��ѯ�û��ύ����ʱѡ�е���Ʒ
	 */
	public ShoppingCart getAllByPid(@Param("pid") Integer pid, @Param("bid") Integer bid);

	public Integer addOrder(Order order);

	/***
	 * �޸Ķ���״̬
	 */
	public Integer updateState(@Param("out_trade_no") String out_trade_no, @Param("state") String state);

	/***
	 * ɾ������ɵĹ��ﳵ��Ϣ
	 */
	public Integer delShopCartById(@Param("pid") Integer pid, @Param("bid") Integer bid);

	/**
	 * ��ѯ���û��Ƿ����۹�����Ʒ
	 */
	public Integer selectCommentCountByBid(@Param("bid") Integer bid, @Param("pid") Integer pid);

	/**
	 * �������
	 * 
	 * @param comment
	 * @return
	 */
	public Integer addComment(Comment comment);

	/**
	 * ��ѯ����ɵĶ���
	 */
	public Integer selectOrderStateOk(Integer bid);

	/**
	 * ��ѯδ��ɵĶ���
	 */
	public Integer selectOrderStateFalse(Integer bid);

	/**
	 * ע��ʱ��ѯ��û���ظ��˺�2020-4-28
	 */
	public Integer getBuyerCode(String bcode);

	/**
	 * ע��ʱ��ѯ��û���ظ�����2020-4-28
	 */
	public Integer getBuyerEmail(String email);

	/**
	 * ��ӵ�ַ
	 */
	public Integer addaddr(BuyerAdd addr);

	/**
	 * ��ѯ��Ʒ������
	 */
	public Integer sellectSaleCountBypId(Integer pid);
}
