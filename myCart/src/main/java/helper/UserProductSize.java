package helper;

import java.util.HashMap;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;import servlets.loginServlet;


@SuppressWarnings("deprecation")
public class UserProductSize {

	public static Map<String, Long> getCount(SessionFactory factory) 
	{
		Session session = factory.openSession();
		
		String userCount = "Select count(*) from User";
		String productCount = "Select count(*) from Product";
		
		Query query = session.createQuery(userCount);
		Query query2 = session.createQuery(productCount);
		
		
		 Long userCount1 =  (Long) query.list().get(0);
		 Long productCount1 =  (Long) query2.list().get(0);
		 
		 Map<String, Long> map = new HashMap<>();
		 map.put("userCount", userCount1);
		 map.put("productCount", productCount1);
		
		 session.close();

		 return map;
	}

}
