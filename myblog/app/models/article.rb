class Article < ActiveRecord::Base
  belongs_to :user
  def author
    if user
      user.name
    else
      "unname"
    end
  end

  def user_avatar
    if user
      user.avatar
    else
      "/images/original/missing.png"
    end
  end

end
