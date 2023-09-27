package egovframework.appn.service;
import java.util.List;

import egovframework.appn.model.ImagingDTO;
import egovframework.appn.model.ImagingDivisionPatientDTO;
import egovframework.appn.model.PatientDTO;
import egovframework.appn.model.RIS0211RequestDTO;


// 예약 공통 서비스
public interface RISAppnCommonService {
	public List<ImagingDivisionPatientDTO> imagingDivisionPatientSelect();
	public List<ImagingDTO> imagingSelect();
	public List<PatientDTO> patientSelect();

}
