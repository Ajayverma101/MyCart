/*alert("Testing");*/


/* 1. [ADD TO CART FUNTION {JAVASCRIPT}] This function call from index page, through the add to cart button*/
function add_to_cart(pid, pname, price)
{
	/*Basically cart is array but it is in the form String*/
	let cart = localStorage.getItem("cart");
	if(cart==null)
	{
		// no cart yet
		let products = [];
		let product01 = {productId:pid, productName:pname, productQuantity:1,productPrice:price };
		
		// here we push product into products array
		products.push(product01);
		localStorage.setItem("cart",JSON.stringify(products));  /*JSON convert our product into string*/  
		console.log("Product is added first time");
		showToste('Product is added to cart');
		
	}
	else
	{
		// cart is already present [pCart is javaScript array and cart is String]
		let pCart = JSON.parse(cart);
		
		let oldProduct = pCart.find((item)=> item.productId == pid)	/*This function check every item is already present or not if present so oldProducts is true.*/

			console.log(oldProduct);
			
		if(oldProduct)
		{
			// we have to increase the quantity
			oldProduct.productQuantity = oldProduct.productQuantity+1
			
			/*here we match the id througth javaScript the replace the old product value from new value {updated value}*/
			pCart.map((item)=>{
				if(item.productId === oldProduct.productId)
				{
					item.productQuantity = oldProduct.productQuantity;
				}
			})
			localStorage.setItem("cart",JSON.stringify(pCart));
			console.log("Product quantity has been increased")
			showToste(oldProduct.productName+' quantity is increased, Quantity : '+oldProduct.productQuantity);
				
		}
		else{
			// w have to add the new product
			let product01 = {productId:pid, productName:pname, productQuantity:1, productPrice:price };
			pCart.push(product01);
			localStorage.setItem("cart",JSON.stringify(pCart));
			console.log("Product is added")
			showToste('Product is added');
		}
	}
	
	updateCart();
}


/* 2. UPDATE CART FUNCTION*/

function updateCart()
{
	let cartString = localStorage.getItem("cart"); /*HERE WE RECIVE CART INTO STRING FORM */
	let cart = JSON.parse(cartString);  /* HERE WE CONVERT STRING INTO OBJECT  [cart is array]*/
	
	if(cart==null || cart.length==0)
	{
		// EMPTY CART
		console.log("cart is empty !!");
		
	 	// J-Query Language [Vid no. 25]
	 	$(".cart-items").html("(0)");   /*CART ITEMS 0 IF IT'S NULL*/
	 	$(".cart-body").html("<h5>Cart does not have any items...</h5>");   /*SOME MESSAGE IN MODAL0-CART BODY*/
	 	$(".checkout-btn").addClass('disabled');    /* IF CART IS NULL SO CHECKOUT BUTTON IS DISABLED*/
	 	
	}
	else
	{
		// THERE IS SOME ITEM'S TO SHOW
		console.log(cart);
		$(".cart-items").html(`( ${cart.length} )`);    /*Cart length is increase */
		/*Use of BackTiks*/
		let table = `      										 
					<table class='table'>	
						<thead class='thead-light'>
							<tr>
								<th>Item Name</th>
								<th>Price</th>
								<th>Quantity</th>
								<th>Total Price</th>
								<th>Action</th>
							</tr>
						</thead>
						
					`;
							
							
		let totalPrice = 0;
							
		/*Filter or treverse the items*/			
		cart.map((item)=>{
			
			table+=`
					<tr>
						<td>${item.productName}</td>
						<td>${item.productPrice}</td>
						<td>${item.productQuantity}</td>
						<td>${item.productQuantity * item.productPrice}</td>
						<td><button onclick='deleteItemFromCart(${item.productId})' class='btn btn-danger btn-sm'> Remove </button></td>
						
					</tr>
			
					`;
			totalPrice += item.productPrice * item.productQuantity;
			
		})
							
					
		table = table + `
						<tr>
							<td colspan='5' style="text-align:end;" class='text-right fw-bold'> Total Price : ${totalPrice}</td>
						</tr>		
					</table>`;
					
		/*HERE WE PUT ALL ITEMS IN THE TABLE [MODAL]*/			
		$(".cart-body").html(table);
		$(".checkout-btn").removeClass('disabled');    /* IF CART IS NOT NULL SO CHECKOUT BUTTON IS ENABLE VIDEO no. [28]*/				
					
	}
	
}




/*3. DELETE FUNCTION*/

function deleteItemFromCart(pid)      /*get id , then convert into string , then find the match id but not return that id {bcz filter method}, then update the cart*/
{
	let cart =  JSON.parse(localStorage.getItem('cart'));
	
	let newCart =  cart.filter((item) => item.productId != pid);
	
	localStorage.setItem('cart', JSON.stringify(newCart));
	
	updateCart();
	
	showToste('Item is removed from cart');
		
}




/*IF WE NOT WRITE THIS FUNCTION HERE SO WHEN WE RELOAD OUR PAGE THE ITEM WILL BE 0*/
/*WHEN DOCUMENT IS READY THEN METHOD IS CALLED*/
/*TESTING PURPOSE BCZ WHEN PROGRAM RUN THIS FUNCTION CALL AUTOMATTICALY FOR EMPTY CART CHECKING PURPOSE*/
$(document).ready(function(){
	updateCart();	
})



/*TOSTE FUNCTION*/   /*it is also present in E/JAVASCRIPT/Toste file */
 function showToste(content)
        {
            document.getElementById("toste").innerHTML=content;

            var element = document.getElementById("toste");
                element.classList.add("display");

             setTimeout(()=>{
                var element = document.getElementById("toste");
                element.classList.remove("display");
             },2000)   
}


/*For Emaple Purpose [if checkout button not work then Enable this function then try it {but first add Onclick function in Common_modal.jsp/CkeckOut page}]*/
/*function CheckOutJSP()
{
	window.location="CheckOut.jsp";	
}
*/


/*Function for Continue Shooping in CheckOut.jsp Page*/
function continueShopping()
{
	window.location = "index.jsp";
}




