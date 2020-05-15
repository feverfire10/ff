package com.kh.ff.prescription.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.ff.js.model.vo.Js;
import com.kh.ff.prescription.model.vo.Prescription;

@Repository("pDao")
public class PrescriptionDao {
	
	public ArrayList<Prescription> selectPrescriptionAll(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("prescriptionMapper.selectPrescriptionAll");
	}
	public ArrayList<Prescription> selectPrescriptionBase(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("prescriptionMapper.selectPrescriptionBase");
	}
	public ArrayList<Prescription> selectPrescriptionMedi(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("prescriptionMapper.selectPrescriptionMedi");
	}
	public ArrayList<Prescription> selectPrescriptionHand(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("prescriptionMapper.selectPrescriptionHand");
	}
	public ArrayList<Prescription> selectPrescriptionXray(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("prescriptionMapper.selectPrescriptionXray");
	}
	public ArrayList<Prescription> selectPrescriptionCheckup(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("prescriptionMapper.selectPrescriptionCheckup");
	}
	
	public ArrayList<Prescription> selectPrescriptionList(Js j, SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("prescriptionMapper.selectPrescriptionList", j);
	}
	
	public Prescription infoPriceGene(Prescription p, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("prescriptionMapper.infoPriceGene", p);
	}
	public Prescription infoPriceInsu(Prescription p, SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("prescriptionMapper.infoPriceInsu", p);
	}
	
	public int insertPrescription(Prescription p, SqlSessionTemplate sqlSession) {
		System.out.println(p);
		return sqlSession.insert("prescriptionMapper.insertPrescription", p);
	}
	
	public int insertBillForm(Prescription p, SqlSessionTemplate sqlSession) {
		return sqlSession.insert("prescriptionMapper.insertBillForm", p);
	}
	
	public int deletePreCode(Prescription p, SqlSessionTemplate sqlSession) {
		return sqlSession.delete("prescriptionMapper.deletePreCode", p);
	}
	
	public ArrayList<Prescription> divPrescriptionArea(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("prescriptionMapper.divPrescriptionArea");
	}
	

}
