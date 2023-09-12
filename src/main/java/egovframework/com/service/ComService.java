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
	List<RisUserDTO> RisUserList();
	List<RisPgrmDTO> RisPrgmList();
	List<RisBtnDTO> RisBtnList();
	List<RisGrupDTO> RisGrupList();
	List<RisGrmuDTO> RisGrmuList(String type);
	List<RisUserDTO> RisUserMenuList();
	List<RisUrmnDTO> RisUserMenuList2(Map<String, String> params);
}
