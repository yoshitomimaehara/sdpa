package model;

import dao.MensajeDao;

public class MensajeModel {
	public static String getMensaje(String codmen){
		MensajeDao dao = new MensajeDao();
		String men=dao.getMensaje(codmen);
		return men;
		
	}
}
