package procedure;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet; 

public class callprocedure {
	public static final String DRIVER_CLASS ="com.mysql.jdbc.Driver";
	public static final String URL="jdbc:mysql://localhost:3306/school";
	public static final String USERNAME="root";
	public static final String PASSWORD="16281262";
	
	public static void main(String[]args)throws Exception{
		Class.forName(DRIVER_CLASS);
		Connection connection=DriverManager.getConnection(URL,USERNAME,PASSWORD);
		String sql1="{call singleselect}"; //���ô洢����singleselect
		String sql2="{call multiselect}";  //���ô洢����multiselect
		CallableStatement cstm= connection.prepareCall(sql1); //ʵ��������cstm
		ResultSet rs=cstm.executeQuery();
		System.out.println("Call procedure singleselect,the result is: ");
		while(rs.next()){
			String trips=rs.getString(1);
			String route=rs.getString(2);
			String driven_distance=rs.getString(3);
			String driven_time=rs.getString(4);
			System.out.println(trips+","+route+","+driven_distance+","+driven_time);
		}
		CallableStatement cstm2=connection.prepareCall(sql2);//ʵ��������cstm2
		ResultSet rs2=cstm2.executeQuery();
		System.out.println("Call procedure multiselect,the result is: ");
		while(rs2.next()){
			int id=rs2.getInt(1);
			String originating_station=rs2.getString(2);
			String arrival_station=rs2.getString(3);
			String route2=rs2.getString(4);
			System.out.println(id+","+originating_station+","+arrival_station+","+route2);
		}
		cstm2.close();
		cstm.close();
		connection.close();		
	}
}
