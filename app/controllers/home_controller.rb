class HomeController < ApplicationController
def site
	@posts = Post.all
end
end
