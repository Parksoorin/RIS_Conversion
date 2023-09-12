package egovframework.stts.service;

import java.util.List;
import java.util.Map;

import egovframework.stts.model.Ris1201DTO;

public interface SttsService {
	List<Ris1201DTO> getRis1201List(Map<String, Integer> param);
}
