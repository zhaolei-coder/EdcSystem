package com.edc.service;

import com.edc.entity.Admin;
import com.edc.entity.Buyer;
import com.edc.entity.Product;
import com.edc.entity.ProductType;
import com.edc.entity.Seller;
import com.edc.entity.Vipuser;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

@Service
public interface Back_AdminService {
	// 鐧诲綍
	Admin userlogin(@Param("name") String name);

	// 鏌ヨ鎵�鏈夊晢瀹朵俊鎭�
	public List<Seller> getAllSeller(Integer pageIndex, Integer pageSize, String SellerName);

	// 鏌ヨ鍟嗗涓暟
	public Integer getSellerCount(String SellerName);

	// 鏌ヨ鎵�鏈塿ip鐢ㄦ埛
	public List<Buyer> getAllVipUsers(@Param("pageIndex") Integer pageIndex, @Param("pageSize") Integer pageSize,
			@Param("name") String name);

	// 鏌ヨ鍟嗗涓暟
	public Integer getVipUserCount(@Param("name") String name);

	// 鍒犻櫎鍟嗗淇℃伅
	public Integer deleteSeller(@Param("sid") Integer sid);

	// 登录查询是否有商家
	public Seller sellerLogin(@Param("mCode") String mcode);

	// 查询所有商品信息
	public List<Product> getAllproduct(@Param("pageIndex") Integer pageIndex, @Param("pageSize") Integer pageSize,
			@Param("proName") String proName, @Param("sid") Integer sid);

	// 查询所有商品数量
	public Integer getProductCount(String proName, Integer sid);

	// 商品删除
	public Integer deleteProduct2(@Param("pid") Integer pid);

	// 删除会员
	public Integer deleteVipuser(int id);

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
	public Integer updateSeller(Seller seller);
}
