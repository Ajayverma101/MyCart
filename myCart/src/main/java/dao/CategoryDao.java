package dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import entities.Category;

public class CategoryDao {

	private SessionFactory factory;

	public CategoryDao(SessionFactory factory) {
		this.factory = factory;
	}
	
	// Save the category to database
	public int saveCategory(Category cat) 
	{
		Session session = this.factory.openSession();
		Transaction transaction = session.beginTransaction();
			
		int id = (int) session.save(cat);
		transaction.commit();
		session.close();		
		return id;
	}
	
	
	// return category list from database
	public List<Category> getCategories()
	{
		Session session1 = this.factory.openSession();
		Query query = session1.createQuery("from Category");
		List<Category> list = query.list();
		return list;
	}
	
	
	public Category getCategoryById(int cid)
	{
		Category cat = null;
		
		try {
			
			Session session = this.factory.openSession();
			cat = session.get(Category.class, cid);
			
			session.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return cat;
	}
	
	
}
