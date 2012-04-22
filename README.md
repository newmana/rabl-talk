rabl-talk
=========

RABL talk for Brisbane Ruby Group

http://railscasts.com/episodes/322-rabl

Example

Controller
...
         render :json => foo.new_result

..
 def new_result
    result = {
        "name" => self.source.name,
        "attributes" => self.display_attributes
    }
    return {
        "result" => result,
        "foo" => self.bar,
    }
  end

  def as_json(options={ })
    {
        :id => self.id,
        :foo => {
            :bar => self.bar,
        },
        :archived => self.archived,
        :user => {
            :first_name => self.user.first_name,
            :last_name => self.user.last_name,
        }
    }
  end

