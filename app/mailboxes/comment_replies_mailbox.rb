class CommentRepliesMailbox < ApplicationMailbox
  REGEX = /reply-(.+)@example.com/i

  def process
    return unless user.present?

    discusstion.comments.create(
      user: user,
      body: mail.decoded
    )
  end

  def user
    @user ||= User.find_by(email: mail.from)
  end

  def discussion
    @discussion ||= Discussion.find(discussion_id)
  end

  def discussion_id
    recepient = mail.recipients.find{ |r| REGEX.match?(r) }
    recepient[REGEX, 1]
  end
end
