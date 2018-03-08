To Do

Add groups to prayer form

Add Leave/Join routes/paths for group/controller








Model Associations

	User
		Has many prayers, fk author_id
		has many user_groups
		has many groups through user_groups
		has many lead groups
		Has many comments
		Has many commented_prayers(prayers), through comments
	
	Prayer
		Has many group_prayers
		Has many groups, through group_prayers
		Has many Comments
		Has many Commenters(users), through comments
		Belongs to Author

	Groups
		Has many user_groups
		Has many members, through user_groups (source = group_member)
		Has many group_prayers
		Has_many prayers, through group_prayers
		Belongs to leader(user)

	UserGroup
		Belongs to Group_member (user)
		Belongs to Group

	GroupPrayer
		Belongs to Group
		Belongs to Prayer
	
	Comments
		Belongs to Commentor (user)
		Belongs to Commented_Prayer (prayer)