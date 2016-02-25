class Todo < ActiveRecord::Base
  def indicate_complete
    if self.completed == true
    @g = "https://encrypted-tbn3.gstatic.com/images?q=tbn:ANd9GcQaSDbB2-_z6rGSMhBzwt5jMlKF4UI92wcmEhfNF1pN86SEr3cKuQ"
    else
    @g = "http://www.clker.com/cliparts/v/c/G/q/s/h/done-button-png-hi.png"
    end
  end
  def name
    x = self.user_id
    y = User.find_by_id(x)
    return y.name
  end
  def contributor_name
    x = self.contributor_id
    y = User.find_by_id(x)
    return y.name
  end
end