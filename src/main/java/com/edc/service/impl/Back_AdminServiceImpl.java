package com.edc.service.impl;

import com.edc.entity.Admin;
import com.edc.entity.Buyer;
import com.edc.entity.Product;
import com.edc.entity.ProductType;
import com.edc.entity.Seller;
import com.edc.entity.Vipuser;
import com.edc.mapper.Back_AdminMapper;
import com.edc.service.Back_AdminService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class Back_AdminServiceImpl implements Back_AdminService {
	@Autowired
	private Back_AdminMapper edcMapper;

	@Override
	public Admin userlogin(String name) {
		return edcMapper.userlogin(name);
	}

	@Override
	public List<Seller> getAllSeller(Integer pageIndex, Integer pageSize, String SellerName) {
		return edcMapper.getAllSeller(pageIndex, pageSize, SellerName);
	}

	@Override
	public Integer getSellerCount(String SellerName) {
		return edcMapper.getSellerCount(SellerName);
	}

	@Override
	public Integer getVipUserCount(String name) {
		// ********方法调用错误，mapper映射xml中的sql有所修改2020-4-13 16:58:39
		return edcMapper.getVipUserCount(name);
	}

	@Override
	public Integer deleteSeller(Integer sid) {
		Integer count = edcMapper.selectProCountBySeller(sid);
		if (count > 0) {
			Integer pid = edcMapper.deleteProduct(sid);
			if (pid > 0) {
				Integer dsid = edcMapper.deleteSeller(sid);
				if (dsid > 0) {
					return 1;
				} else {
					return 0;
				}
			} else {
				return 0;
			}
		} else {
			Integer dsid2 = edcMapper.deleteSeller(sid);
			if (dsid2 > 0) {
				return 1;
			} else {
				return 0;
			}
		}
	}

	@Override
	public Seller sellerLogin(String mcode) {

		return edcMapper.sellerLogin(mcode);
	}

	@Override
	public Integer getProductCount(String proName, Integer sid) {
		return edcMapper.getProductCount(proName, sid);
	}

	@Override
	public Integer deleteProduct2(Integer pid) {
		return edcMapper.deleteProduct2(pid);
	}

	public Integer deleteVipuser(int id) {
		return edcMapper.deleteVipuser(id);
	}

	@Override
	public List<Buyer> getAllVipUsers(Integer pageIndex, Integer pageSize, String name) {
		// TODO Auto-generated method stub

		return edcMapper.getAllVipUsers(pageIndex, pageSize, name);
	}

	@Override
	public List<Product> getAllproduct(Integer pageIndex, Integer pageSize, String proName, Integer sid) {
		// TODO Auto-generated method stub

		return edcMapper.getAllproduct(pageIndex, pageSize, proName, sid);
	}

	@Override
	public List<ProductType> selectAllProductType() {
		// TODO Auto-generated method stub
		return edcMapper.selectAllProductType();
	}

	@Override
	public Integer saveSeller(Seller seller) {
		System.out.println("SellerRegisterService saveSeller" + seller);
		return edcMapper.saveSeller(seller);
	}

	@Override
	public Integer saveProduct(Product product) {
		// TODO Auto-generated method stub
		return edcMapper.saveProduct(product);
	}

	@Override
	public Integer getProductPicCount(String proPicName) {
		// TODO Auto-generated method stub
		return edcMapper.getProductPicCount(proPicName);
	}

	@Override
	public Product getProductByPid(Integer pid) {
		// TODO Auto-generated method stub
		return edcMapper.getProductByPid(pid);
	}

	@Override
	public Integer updateProduct(Product product) {
		// TODO Auto-generated method stub
		return edcMapper.updateProduct(product);
	}

	@Override
	public Seller getSellerInfo(Integer shopId) {
		// TODO Auto-generated method stub
		return edcMapper.getSellerInfo(shopId);
	}

	@Override
	public Integer updateSeller(Seller seller) {
		// TODO Auto-generated method stub
		return edcMapper.updateSeller(seller);
	}
}
