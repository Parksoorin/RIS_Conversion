package egovframework.pandok.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;

import egovframework.pandok.model.Ris0601DTO;

@Mapper("PandokMapper")
public interface PandokMapper {
	List<Ris0601DTO> getRis0601List();
}