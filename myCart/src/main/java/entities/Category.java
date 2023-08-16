package entities;

import java.util.ArrayList;
import java.util.List;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

@Entity
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int categoryID;
	private String categoryTitle;
	private String categoryDescription;
	
	@OneToMany(mappedBy = "category")
	private List<Product> products = new ArrayList<>(); 
	
	public Category() {
	}

	
	
	public Category(int categoryID, String categoryTitle, String categoryDescription) {
		this.categoryID = categoryID;
		this.categoryTitle = categoryTitle;
		this.categoryDescription = categoryDescription;
	}


	public Category(String categoryTitle, String categoryDescription, List<Product> products) {
		this.categoryTitle = categoryTitle;
		this.categoryDescription = categoryDescription;
		this.products = products;
	}


	public List<Product> getProducts() {
		return products;
	}



	public void setProducts(List<Product> products) {
		this.products = products;
	}



	public int getCategoryID() {
		return categoryID;
	}


	public void setCategoryID(int categoryID) {
		this.categoryID = categoryID;
	}


	public String getCategoryTitle() {
		return categoryTitle;
	}


	public void setCategoryTitle(String categoryTitle) {
		this.categoryTitle = categoryTitle;
	}


	public String getCategoryDescription() {
		return categoryDescription;
	}


	public void setCategoryDescription(String categoryDescription) {
		this.categoryDescription = categoryDescription;
	}


	@Override
	public String toString() {
		return "category [categoryID=" + categoryID + ", categoryTitle=" + categoryTitle + ", categoryDescription="
				+ categoryDescription + "]";
	}
	

	
}
