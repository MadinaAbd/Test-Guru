class Admin::GistsController < Admin::BaseController

  def index
    @gists = Gist.all
  end

  def destroy
    @gist = Gist.find(params[:id])
    @gist.destroy
    redirect_to admin_gists_path, status: :see_other
  end
end
