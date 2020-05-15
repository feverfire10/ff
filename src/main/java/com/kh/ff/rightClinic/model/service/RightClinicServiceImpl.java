package com.kh.ff.rightClinic.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.ff.rightClinic.model.dao.RightClinicDao;
import com.kh.ff.rightClinic.model.vo.DiseaseRc;
import com.kh.ff.rightClinic.model.vo.PatientJs;
import com.kh.ff.rightClinic.model.vo.PrescriptionRc;
import com.kh.ff.rightClinic.model.vo.SymptomRc;

@Service("rcService")
public class RightClinicServiceImpl implements RightClinicService {

	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private RightClinicDao rcDao;
	
	@Override
	public ArrayList<PatientJs> selPatientsList(String receiptDate, String patientsName, String clinicState) {
		return rcDao.selPatientsList(sqlSession, receiptDate, patientsName, clinicState);
	}

	@Override
	public ArrayList<PatientJs> selOnePatientList(String patiName, String patiSSN) {
		return rcDao.selOnePatientList(sqlSession, patiName, patiSSN);
	}

	@Override
	public ArrayList<DiseaseRc> selDiseaseHistory(String clickDate, String clickPatientsName, String clickPatientsPno) {
		return rcDao.selDiseaseHistory(sqlSession, clickDate, clickPatientsName, clickPatientsPno);
	}

	@Override
	public ArrayList<SymptomRc> selSymptomHistory(String clickDate, String clickPatientsName,
			String clickPatientsPno) {
		return rcDao.selSymptomHistory(sqlSession, clickDate, clickPatientsName, clickPatientsPno);
	}

	@Override
	public ArrayList<PrescriptionRc> selPrescriptionHistory(String clickDate, String clickPatientsName,
			String clickPatientsPno) {
		return rcDao.selPrescriptionHistory(sqlSession, clickDate, clickPatientsName, clickPatientsPno);
	}
	

}





