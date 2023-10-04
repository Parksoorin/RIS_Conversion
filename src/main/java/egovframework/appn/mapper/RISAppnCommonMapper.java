package egovframework.appn.mapper;

import java.util.List;

import org.egovframe.rte.psl.dataaccess.mapper.Mapper;
import egovframework.appn.model.*;

@Mapper("RISAppnCommonMapper")
public interface RISAppnCommonMapper {
	public List<ImagingDivisionPatientDTO> imagingDivisionPatientSelect();
	public List<ImagingDTO> imagingSelect();
	public List<PatientDTO> patientSelect();
	public List<RISAppnCalDTO> risappnCalSelect(RISAppnCalRequestDTO dto);
	
	
	
}
