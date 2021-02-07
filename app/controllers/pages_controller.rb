class PagesController < InheritedResources::Base
  http_basic_authenticate_with name: "admin", password: "password", except: :permalink
  before_action :fetch_items_count
  before_action :user_helper


  def permalink
    @page = Page.find_by(permalink: params[:permalink])
    redirect_to root_path if @page.nil?
  end

  private

  def page_params
    params.require(:page).permit(:title, :content, :permalink)
  end
end
