package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import database.AccesoDB;
import interfaces.IMensajesDao;

public class  MensajeDao implements IMensajesDao{

    @Override
    public String getMensaje(String codigo) {
	Connection cn=null;
	String men=null;
	try {
	    cn=AccesoDB.getConnection();
	    String sql="select mensaje from mensaje where codmensaje=?";
	    PreparedStatement pstm = cn.prepareStatement(sql);
	    pstm.setString(1,codigo);
	    ResultSet rs=pstm.executeQuery();
	    rs.next();
	    men=rs.getString(1);
	    rs.close();
	    pstm.close();
	    
	} catch (Exception e) {
	    throw new RuntimeException(e.getMessage());
	}finally{
	    try {
		cn.close();
	    } catch (Exception e2) {
	    }
	}
	return men;
    }

}
