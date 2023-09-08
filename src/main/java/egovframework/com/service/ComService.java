package egovframework.com.service;

import java.util.List;

import egovframework.com.model.RISPRGMQ00DTO;
import egovframework.com.model.RISUSERQ00DTO;

public interface ComService {
	List<RISUSERQ00DTO> RisUserList();
	List<RISPRGMQ00DTO> RisPrgmList();
}
