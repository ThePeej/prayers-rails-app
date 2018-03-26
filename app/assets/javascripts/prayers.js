$(function() {
  console.log("loaded!")

  $('img#prayer_hands').click(function(){
    console.log("HAAAAAAAAAAAAAAAAAAAAAANDS!")
  })

  $('button#show_comments').click(function(e){
    if ($('article.message').length){
      hideComments()
    } else {
      showComments(this)
    }
    
  })
})


function showComments(button) {
  let prayerId = parseInt(button.dataset.prayerId)
  let currentUser = button.dataset.currentUser
  let posting = $.get(`/prayers/${prayerId}/comments.json`)
  posting.done(function(response){
    // response is array of comments => iterate over array and create new Comment per each
    response.forEach(function(comment){
      let id = comment["id"]
      let content = comment["content"]
      let commenter = comment["commenter"]["username"]
      let time = comment["time"]
      let adminButtons = false;
      if (currentUser === commenter){
        adminButtons = true;
      }
      comment = new Comment(id, prayerId, content, commenter, time, adminButtons)
      comment.display()
    })
  })
}

function hideComments() {
  let commentCount = $('article.message').length
  $('div#comments_index')[0].innerHTML = '';
  $('button#show_comments')[0].innerHTML = `Show Comments (${commentCount})`
}


class Comment {

  constructor(id, prayerId, content, commenter, time, adminButtons) {
    this.id = id;
    this.prayerId = prayerId;
    this.content = content;
    this.commenter = commenter;
    this.time = time;
    this.adminButtons = adminButtons;
  }

  display(){
    let comment = `<article id="comment-id-${this.id}" class="message"><div class="message-header">`
    comment += `<p><strong>${this.commenter}</strong></p>`
    comment += `${this.time}`
    comment += `</div><div class="message-body">`
    comment += `<p>${this.content}</p><br>`

    if (this.adminButtons) {
      comment += `<a class="button is-small is-outlined" href="/prayers/${this.prayerId}/comments/${this.id}/edit">Edit Comment</a>`
      comment += `<a data-confirm="Delete this comment?" class="button is-small is-outlined" rel="nofollow" data-method="delete" href="/prayers/${this.prayerId}/comments/${this.id}">Delete Comment</a>`
    }
    comment += `</div></article><br>`
    $('div#comments_index').append(comment)
    $('button#show_comments')[0].innerHTML = "Hide Comments"
  }
}

