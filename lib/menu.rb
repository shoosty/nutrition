class Menu
  def link(url, content)
    "<a href=#{url}>#{content}</a>"
  end

  def menu
    "<br>
    <a href= '/'> Main Page</a>
    <br>
    <a href= '/basictext'> Test of Basic Text</a>
    <br>
    #{link('/login', 'Login')}
    <br>
    "
  end
end
