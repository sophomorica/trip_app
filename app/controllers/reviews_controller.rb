class ReviewsController < ApplicationController
  before_action :set_trip
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  def index
    @reviews = @trip.reviews.all

  end

  def show
  end

  def new
    @review = Review.new

  end

  def create
    @review = @trip.reviews.new(review_params)
    if @review.save
      redirect_to trip_path(@trip)
    else
      render :new
    end
  end

  def edit
    render :edit

  end

  def update
    if @review.update(review_params)
     redirect_to trip_path(@trip)
   else
     render :edit
    end
  end

  def destroy
    @review.destroy
    redirect_to trip_path(@trip)

  end

  private
  def set_trip
    @trip = Trip.find(params[:trip_id])
  end
  def set_review
    @review = Review.find(params[:id])
  end
  def review_params
    params.require(:review).permit(:body, :author)
  end
end
