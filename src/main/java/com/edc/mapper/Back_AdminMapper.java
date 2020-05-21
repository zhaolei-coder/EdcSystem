package com.edc.mapper;

import com.edc.entity.Admin;
import com.edc.entity.Buyer;
import com.edc.entity.Product;
import com.edc.entity.ProductType;
import com.edc.entity.Seller;
import com.edc.entity.Vipuser;

import java.util.List;

import org.apache.ibatis.annotations.Param;

public interface Back_AdminMapper {
	// 管理员登录
	Admin userlogin(@Param("name") String name);

	// 查询所有商家信息
	public List<Seller> getAllSeller(@Param("pageIndex") Integer pageIndex, @Param("pageSize") Integer pageSize,
			@Param("name") String name);

	// 查询商家个数
	public Integer getSellerCount(@Param("name") String name);

	// 查询所有vip用户
	public List<Buyer> getAllVipUsers(@Param("pageIndex") Integer pageIndex, @Param("pageSize") Integer pageSize,
			@Param("bname") String name);

	// 查询vipUser个数
	public Integer getVipUserCount(@Param("bname") String name);

	// 删除商家信息
	public Integer deleteSeller(@Param("sid") Integer sid);

	// 删除商品信息
	public Integer deleteProduct(@Param("p_mid") Integer p_mid);

	// 查询店铺中商品数量
	public Integer selectProCountBySeller(@Param("p_mid") Integer p_mid);

	// 登录查询是否有商家
	public Seller sellerLogin(@Param("mCode") String mcode);

	// 查询所有商品信息
	public List<Product> getAllproduct(@Param("pageIndex") Integer pageIndex, @Param("pageSize") Integer pageSize,
			@Param("proName") String proName, @Param("sid") Integer sid);

	// 查询所有商品数量
	public Integer getProductCount(@Param("proName") String proName, @Param("sid") Integer sid);

	// 商品删除
	public Integer deleteProduct2(@Param("pid") Integer pid);

	// 删除会员
	public Integer deleteVipuser(@Param("b_id") int id);

	// 查询所有商品类型
	public List<ProductType> selectAllProductType();

	// 商家注册
	Integer saveSeller(Seller seller);

	// 商品添加
	Integer saveProduct(Product product);

	// 查询商品中是否有同名的图片
	public Integer getProductPicCount(String proPicName);

	// 根据商品ID查询商品信息
	public Product getProductByPid(Integer pid);

	// 根据商品Id修改商品信息
	public Integer updateProduct(Product product);

	// 查询商家信息
	public Seller getSellerInfo(Integer shopId);

	// 修改商家信息
	public Integer updateSeller(@Param("seller") Seller seller);

}
