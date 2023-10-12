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
	
	// 사용자 관리
	@Override
	public List<RisUserDTO> RisUserList() {
		// TODO Auto-generated method stub
		return comMapper.RisUserList();
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
	public int pwReset(RisUserDTO dtos) { 
		// TODO Auto-generated method stub 
		return comMapper.pwReset(dtos);
	}
	
	// 프로그램정보 관리
	@Override
	public List<RisPgrmDTO> RisPgrmList(String hsptId) {
		// TODO Auto-generated method stub
		return comMapper.RisPgrmList(hsptId);
	}
	@Override
	public int updatePgrmData(RisPgrmDTO dto) {
		// TODO Auto-generated method stub
		// 시스템id 변경
		String systemId = comMapper.selectSystemid(dto.getSystemName());
		dto.setSystemId(systemId);
		System.out.println(dto.toString());
		return comMapper.updatePgrmData(dto);
	}
	@Override
	public int addPgrmData(RisPgrmDTO dto) {
		// TODO Auto-generated method stub
		// 시스템id 변경
		String systemId = comMapper.selectSystemid(dto.getSystemName());
		dto.setSystemId(systemId);
		System.out.println(dto.toString());
		return comMapper.addPgrmData(dto);
	}
	@Override
	public int deletePgrmData(RisPgrmDTO dto) {
		// TODO Auto-generated method stub
		// 시스템id 변경
		String systemId = comMapper.selectSystemid(dto.getSystemName());
		dto.setSystemId(systemId);
		System.out.println(dto.toString());
		return comMapper.deletePgrmData(dto);
	}
	
	// 메뉴정보 관리
	@Override
	public List<RisGrupDTO> RisGrupList(String hsptId) {
		// TODO Auto-generated method stub
		return comMapper.RisGrupList(hsptId);
	}
	@Override
	public List<RisGrupDTO> RisGrupList() {
		// TODO Auto-generated method stub
		return comMapper.RisGrupList();
	}
	@Override
	public int updateMenuData(RisGrupDTO dto) {
		// TODO Auto-generated method stub
		return comMapper.updateMenuData(dto);
	}
	@Override
	public int addMenuData(RisGrupDTO dto) {
		// TODO Auto-generated method stub
		return comMapper.addMenuData(dto);
	}
	@Override
	public List<RisGrmuDTO> RisGrmuList(String type) {
		// TODO Auto-generated method stub
		return comMapper.RisGrmuList(type);
	}
	
	// 사용자별 메뉴관리
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
	public List<RisUrmnDTO> popupUrmnList() {
		// TODO Auto-generated method stub
		return comMapper.popupUrmnList();
	}
	
	// 프로그램 기능 권한 관리
	@Override
	public List<RisBtnDTO> RisBtnList() {
		// TODO Auto-generated method stub
		return comMapper.RisBtnList();
	}
	
}