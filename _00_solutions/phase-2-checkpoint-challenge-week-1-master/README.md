# Phase 2 Checkpoint Challenge 1 

## Summary
In this challenge we will be building an app that lets you create stores that have multiple locations and each location could have different products.

A user can create a store, edit a store, and delete a store.
They can also see attributes about this stores locations and it's products.

## Releases
### Release 0: Create The Migrations

Begin by creating a schema and migrations for your application. Set up the relationships in the models provided. 

A Store should at least have a name attribute

A Location should at least have an address attribute

A Product should at least have a name attribute

(Hint) The models should give you and idea about what tables and associations you'll need. Also, there's a seed file that could help as well.


### Release 1: Creating Your Routes

Make some routes
	
	In the stores controller: 
	
	When a user visits '/'(this is in the index controller) it should redirect to '/stores' and show a list of all stores

![home page][home-page]  
	
	When a user clicks on a store it should take them to that stores 'show' page. 

![store show page][store-show-page]  

		While on the stores show page a user should be able to click on an edit link that takes them to an edit page to edit that stores name. 
		
		This page should list the stores locations as well as that locations products.

### Release 2: Creating a Store

		On the Home Page their should be a link to a page where you can create a new store
		
		This page should have a form to enter a name for a new store and create it on submit. 
		If successful they should be redirected to that stores 'show' page

![store new page][store-new-page]  

### Release 3: Updating Store Names 
		The edit page should have a form that allows the user to update the store name. 

![edit store page][store-edit-page]  		

		Make sure you make this for use a PUT request and not a POST

### Release 4: Deleting a Store
		Add a delete button to the edit page that allows the user to delete the store and if successful it redirects them back to the '/stores' listings.

		Make sure you make this for use a DELETE request and not a POST


[home-page]: readme-assets/home.png
[store-show-page]: readme-assets/show.png
[store-edit-page]: readme-assets/edit.png
[store-new-page]: readme-assets/new.png

