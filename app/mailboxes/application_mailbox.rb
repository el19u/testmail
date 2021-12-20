class ApplicationMailbox < ActionMailbox::Base
  # routing /something/i => :somewhere
  # routing /reply-(.+)@example.com/i => :comment_replies
  routing CommentRepliesMailbox::REGEX
end
