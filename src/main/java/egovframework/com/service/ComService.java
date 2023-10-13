package egovframework.com.service;

import java.util.List;
import java.util.Map;

import egovframework.com.model.RisBtnDTO;
import egovframework.com.model.RisGrmuDTO;
import egovframework.com.model.RisGrupDTO;
import egovframework.com.model.RisPgrmDTO;
import egovframework.com.model.RisUrmnDTO;
import egovframework.com.model.RisUserDTO;

public interface ComService {
	// 사용자 관리
	List<RisUserDTO> RisUserList();
	int addList1Data(RisGrupDTO dto);
	int updateData(RisUserDTO dto);
	int addUserData(RisUserDTO dto);
	int pwReset(RisUserDTO dtos);
	
	// 프로그램정보 관리
	List<RisPgrmDTO> RisPgrmList(String hsptId);
	int updatePgrmData(RisPgrmDTO dto);
	int addPgrmData(RisPgrmDTO dto);
	int deletePgrmData(RisPgrmDTO dto);
	
	// 메뉴정보 관리
	List<RisGrupDTO> RisGrupList();
	List<RisGrupDTO> RisGrupList(String hsptId);
	int updateMenuData(RisGrupDTO dto);
	int addMenuData(RisGrupDTO dto);
	List<RisGrmuDTO> RisGrmuList(Map<String, String> params);
	List<RisGrmuDTO> popupGrmuList(String hsptId);
	int updateMenuData2(RisGrmuDTO dto);
	int addMenuData2(RisGrmuDTO dto);
	
	// 사용자별 메뉴관리
	List<RisUserDTO> RisUserMenuList(String hsptId);
	List<RisUrmnDTO> RisUserMenuList2(Map<String, String> params);
	List<RisUrmnDTO> popupUrmnList();
	
	// 프로그램 기능 권한 관리
	List<RisBtnDTO> RisBtnList();	
}
