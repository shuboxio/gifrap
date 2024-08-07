# frozen_string_literal: true

class ImagesController < ApplicationController
  def index
    @images = Image.order(created_at: :desc)
    @image = current_user.images.new(url: '')
  end

  def new
    url = CGI.unescape(params.fetch(:url, ''))

    @image = current_user.images.new(url:)
  end

  def edit
    @image = current_user.images.find(params[:id])
  end

  def create
    @image = current_user.images.new(image_params)

    if @image.save
      redirect_to root_path, notice: t('.created'), status: :see_other
    else
      render :new
    end
  end

  def update
    @image = current_user.images.find(params[:id])

    if @image.update(image_params)
      redirect_to root_path, notice: t('.updated')
    else
      render :edit
    end
  end

  def destroy
    @image = current_user.images.find(params[:id])
    @image.destroy

    redirect_to root_path, notice: t('.destroyed')
  end

  private

  def image_params
    params.require(:image).permit(:url, :nsfw)
  end
end
