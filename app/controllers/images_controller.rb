# frozen_string_literal: true

class ImagesController < ApplicationController
  def index
    @images = Image.all
    @image = Image.new(url: '')
  end

  def new
    @image = Image.new(url: '')
  end

  def edit
    @image = Image.find(params[:id])
  end

  def create
    @image = Image.new(image_params)

    if @image.save
      redirect_to root_path, notice: 'Image was successfully created.'
    else
      render :new
    end
  end

  def update
    @image = Image.find(params[:id])

    if @image.update(image_params)
      redirect_to root_path, notice: 'Image was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @image = Image.find(params[:id])
    @image.destroy

    redirect_to root_path, notice: 'Image was successfully destroyed'
  end

  private

  def image_params
    params.require(:image).permit(:url, :nsfw)
  end
end
