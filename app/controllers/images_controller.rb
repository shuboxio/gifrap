# frozen_string_literal: true

class ImagesController < ApplicationController
  def index
    @images = Image.all
    @image = Image.new(url: '')
  end

  def new
    url = CGI.unescape(params.fetch(:url, ''))

    @image = Image.new(url:)
  end

  def edit
    @image = Image.find(params[:id])
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to root_path, notice: t('.created')
    else
      render :new
    end
  end

  def update
    @image = Image.find(params[:id])

    if @image.update(image_params)
      redirect_to root_path, notice: t('.updated')
    else
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    redirect_to root_path, notice: t('.destroyed')
  end

  private

  def image_params
    params.require(:image).permit(:url, :nsfw)
  end
end
