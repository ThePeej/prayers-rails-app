Models
	User
		Has many authored_prayers
		Has many comments
		Has many commented_prayers(prayers), through comments
	
	Prayer
		Belongs to Author
		Has many Comments
		Has many Commenters(users), through comments

	

	Groups


	-Comments


