# Specifications for the Rails with jQuery Assessment

Specs:
- [x] Use jQuery for implementing new requirements
- [ ] Include a show resource rendered using jQuery and an Active Model Serialization JSON backend. (navigate through prayers... then => )
- [ ] Include an index resource rendered using jQuery and an Active Model Serialization JSON backend. (load prayer comments on prayer show page)
- [ ] Include at least one has_many relationship in information rendered via JSON and appended to the DOM. (prayer has many comments)
- [ ] Use your Rails API and a form to create a resource and render the response without a page refresh. (create comments on prayer)
- [ ] Translate JSON responses into js model objects. (comments?!)
- [ ] At least one of the js model objects must have at least one method added by your code to the prototype. => (Formatters work really well for this. Borrowing from the previous example, instead of plainly taking the JSON response of the newly created comment and appending it to the DOM, you would create a Comment prototype object and add a function to that prototype to perhaps concatenate (format) the comments authors first and last name. You would then use the object to append the comment information to the DOM.)

Confirm
- [ ] You have a large number of small Git commits
- [ ] Your commit messages are meaningful
- [ ] You made the changes in a commit that relate to the commit message
- [ ] You don't include changes in a commit that aren't related to the commit message
