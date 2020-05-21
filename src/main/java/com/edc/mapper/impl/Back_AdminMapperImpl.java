package com.edc.mapper.impl;

import com.edc.entity.Admin;
import com.edc.entity.Buyer;
import com.edc.entity.Product;
import com.edc.entity.ProductType;
import com.edc.entity.Seller;
import com.edc.entity.Vipuser;
import com.edc.mapper.Back_AdminMapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Back_AdminMapperImpl extends SqlSessionDaoSupport implements Back_AdminMapper {
	@Override
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}

	// 绠＄悊鍛樼櫥褰�
	@Override
	public Admin userlogin(String name) {
		return this.getSqlSession().getMapper(Back_AdminMapper.class).userlogin(name);
	}

	// 鏌ユ柊鍟嗗鍒楄〃
	@Override
	public List<Seller> getAllSeller(Integer pageIndex, Integer pageSize, String SellerName) {
		return this.getSqlSession().getMapper(Back_AdminMapper.class).getAllSeller(pageIndex, pageSize, SellerName);
	}

	@Override
	public Integer getSellerCount(String SellerName) {
		return this.getSqlSession().getMapper(Back_AdminMapper.class).getSellerCount(SellerName);
	}

	@Override
	public List<Buyer> getAllVipUsers(Integer pageIndex, Integer pageSize, String name) {
		// ********方法调用错误，mapper映射xml中的sql有所修改2020-4-13 16:58:39
		return this.getSqlSession().getMapper(Back_AdminMapper.class).getAllVipUsers(pageIndex, pageSize, name);
	}

	@Override
	public Integer getVipUserCount(String name) {
		return this.getSqlSession().getMapper(Back_AdminMapper.class).getVipUserCount(name);
	}

	@Override
	public Integer deleteSeller(Integer sid) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Back_AdminMapper.class).deleteSeller(sid);
	}

	@Override
	public Integer deleteProduct(Integer p_mid) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Back_AdminMapper.class).deleteProduct(p_mid);
	}

	@Override
	public Integer selectProCountBySeller(Integer p_mid) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Back_AdminMapper.class).selectProCountBySeller(p_mid);
	}

	@Override
	public Seller sellerLogin(String mcode) {
		return this.getSqlSession().getMapper(Back_AdminMapper.class).sellerLogin(mcode);
	}

	@Override
	public List<Product> getAllproduct(Integer pageIndex, Integer pageSize, String proName, Integer sid) {
		return this.getSqlSession().getMapper(Back_AdminMapper.class).getAllproduct(pageIndex, pageSize, proName, sid);
	}

	@Override
	public Integer getProductCount(String proName, @Param("sid") Integer sid) {
		return this.getSqlSession().getMapper(Back_AdminMapper.class).getProductCount(proName, sid);
	}

	@Override
	public Integer deleteProduct2(Integer pid) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Back_AdminMapper.class).deleteProduct2(pid);
	}

	// 删除会员
	@Override
	public Integer deleteVipuser(int id) {
		return this.getSqlSession().getMapper(Back_AdminMapper.class).deleteVipuser(id);
	}

	@Override
	public List<ProductType> selectAllProductType() {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Back_AdminMapper.class).selectAllProductType();
	}

	@Override
	public Integer saveSeller(Seller seller) {
		return this.getSqlSession().getMapper(Back_AdminMapper.class).saveSeller(seller);
	}

	@Override
	public Integer saveProduct(Product product) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Back_AdminMapper.class).saveProduct(product);
	}

	@Override
	public Integer getProductPicCount(String proPicName) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Product getProductByPid(Integer pid) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Back_AdminMapper.class).getProductByPid(pid);
	}

	@Override
	public Integer updateProduct(Product product) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Back_AdminMapper.class).updateProduct(product);
	}

	@Override
	public Seller getSellerInfo(Integer shopId) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Back_AdminMapper.class).getSellerInfo(shopId);
	}

	@Override
	public Integer updateSeller(Seller seller) {
		// TODO Auto-generated method stub
		return this.getSqlSession().getMapper(Back_AdminMapper.class).updateSeller(seller);
	}
}
