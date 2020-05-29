json.user_name @comment.user.nickname
json.created_at @comment.created_at.strftime("%Y年%m月%d日 %H時%M分")
json.content @comment.content