package com.kh.ff.rightClinic.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ff.rightClinic.model.vo.DiseaseRc;
import com.kh.ff.rightClinic.model.vo.PatientJs;
import com.kh.ff.rightClinic.model.vo.PrescriptionRc;
import com.kh.ff.rightClinic.model.vo.SymptomRc;
import com.kh.ff.vital.model.vo.Vital;

@Repository("rcDao")
public class RightClinicDao {

	public ArrayList<PatientJs> selPatientsList(SqlSessionTemplate sqlSession, String receiptDate, String patientsName,
			String clinicState) {
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("receiptDate", receiptDate);
		params.put("patientsName", patientsName);
		params.put("clinicState", clinicState);

		return (ArrayList) sqlSession.selectList("rightClinicMapper.selPatientsList", params);
	}
	
	public ArrayList<PatientJs> selOnePatientList(SqlSessionTemplate sqlSession, String patiName, String patiSSN) {
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("patiName", patiName);
		params.put("patiSSN", patiSSN);

		return (ArrayList) sqlSession.selectList("rightClinicMapper.selOnePatientList", params);
	}
	
	public ArrayList<PrescriptionRc> selPrescriptionHistory(SqlSessionTemplate sqlSession,  String clickDate, String clickPatientsName,
			String clickPatientsPno){
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("clickDate", clickDate);
		params.put("clickPatientsName", clickPatientsName);
		params.put("clickPatientsPno", clickPatientsPno);

		return (ArrayList) sqlSession.selectList("rightClinicMapper.selPrescriptionHistory", params);
	}
	
	public ArrayList<DiseaseRc> selDiseaseHistory(SqlSessionTemplate sqlSession,  String clickDate, String clickPatientsName,
			String clickPatientsPno){
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("clickDate", clickDate);
		params.put("clickPatientsName", clickPatientsName);
		params.put("clickPatientsPno", clickPatientsPno);

		return (ArrayList) sqlSession.selectList("rightClinicMapper.selDiseaseHistory", params);
	}
	
	public ArrayList<SymptomRc> selSymptomHistory(SqlSessionTemplate sqlSession,  String clickDate, String clickPatientsName,
			String clickPatientsPno){
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("clickDate", clickDate);
		params.put("clickPatientsName", clickPatientsName);
		params.put("clickPatientsPno", clickPatientsPno);

		return (ArrayList) sqlSession.selectList("rightClinicMapper.selSymptomHistory", params);
	}
	
	public ArrayList<Vital> selVitalChartList(SqlSessionTemplate sqlSession, String clickPatientsName, String clickPatientsPno){
		HashMap<String, String> params = new HashMap<String, String>();
		params.put("clickPatientsName", clickPatientsName);
		params.put("clickPatientsPno", clickPatientsPno);

		return (ArrayList) sqlSession.selectList("rightClinicMapper.selectVitalList", params);
	}
}
