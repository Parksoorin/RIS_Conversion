package egovframework.com.service.impl;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import egovframework.com.mapper.ComMapper;
import egovframework.com.model.RisBtnDTO;
import egovframework.com.model.RisGrmuDTO;
import egovframework.com.model.RisGrupDTO;
import egovframework.com.model.RisPgrmDTO;
import egovframework.com.model.RisUrmnDTO;
import egovframework.com.model.RisUserDTO;
import egovframework.com.service.ComService;


@Service("ComService")
public class ComServiceImpl implements ComService {
	
	@Resource(name = "ComMapper")
	private ComMapper comMapper;
	@Override
	public List<RisUserDTO> RisUserList() {
		// TODO Auto-generated method stub
		return comMapper.RisUserList();
	}
	@Override
	public List<RisPgrmDTO> RisPrgmList() {
		// TODO Auto-generated method stub
		return comMapper.RisPrgmList();
	}
	@Override
	public List<RisBtnDTO> RisBtnList() {
		// TODO Auto-generated method stub
		return comMapper.RisBtnList();
	}
	@Override
	public List<RisGrupDTO> RisGrupList() {
		// TODO Auto-generated method stub
		return comMapper.RisGrupList();
	}
	@Override
	public List<RisGrmuDTO> RisGrmuList(String type) {
		// TODO Auto-generated method stub
		return comMapper.RisGrmuList(type);
	}
	@Override
	public List<RisUserDTO> RisUserMenuList() {
		// TODO Auto-generated method stub
		return comMapper.RisUserMenuList();
	}

	@Override
	public List<RisUrmnDTO> RisUserMenuList2(Map<String, String> params) {
		// TODO Auto-generated method stub
		return comMapper.RisUserMenuList2(params);
	}
	@Override
	public int addList1Data(RisGrupDTO dto) {
		// TODO Auto-generated method stub
		return comMapper.addList1Data(dto);
	}
	@Override
	public int updateData(RisUserDTO dto) {
		// TODO Auto-generated method stub
		// 권한 변경
		String mddlCd = comMapper.selectMddlcd(dto.getMddlKrNm());
		dto.setUserGrade(mddlCd);
		return comMapper.updateData(dto);
	}
	@Override
	public int addUserData(RisUserDTO dto) {
		// TODO Auto-generated method stub
		// 권한 변경
		String mddlCd = comMapper.selectMddlcd(dto.getMddlKrNm());
		dto.setUserGrade(mddlCd);
		return comMapper.addUserData(dto);
	}

	 @Override
	 public RisUserDTO pwReset(List<RisUserDTO> dtos) { 
		 // TODO Auto-generated method stub 
		 return comMapper.pwReset(dtos);
	 }
	 
}