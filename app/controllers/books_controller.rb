class BooksController < ApplicationController
  before_action :set_segment
#USER : Should be already selected in order to add comments

  def index
    @books = Book.all
  end

  # GET /books/1
  # GET /books/1.json
  def show
  end

  # GET /books/new
  def new
    @book = Book.new
  end

  # GET /books/1/edit

  def edit
    set_segment
    @book= Book.find(params[:id])
  end


  # POST /books
  # POST /books.json

#  def create
#    @book = Book.new(book_params)
#    respond_to do |format|
#      if @book.save
#        format.html { redirect_to @book, notice: 'Book was successfully created.' }
#        format.json { render :show, status: :created, location: @book }
#      else
#        format.html { render :new }
#        format.json { render json: @book.errors, status: :unprocessable_entity }
#      end
#    end
#  end

  def create
    set_segment
    @book= @segment.book.create(book_params)
    redirect_to @post
  end



  # PATCH/PUT /books/1
  # PATCH/PUT /books/1.json
  def update
    respond_to do |format|
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|  #What is this doing
      @book = Book.find(params[:id])
      @book.update(book_params)
      if @book.update(book_params)
        format.html { redirect_to @book, notice: 'Book was successfully updated.' }
        format.json { render :show, status: :ok, location: @book }
      else
        format.html { render :edit }
        format.json { render json: @book.errors, status: :unprocessable_entity }
      end
      redirect_to @segment
    end
  end


  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book.destroy
    respond_to do |format|
      format.html { redirect_to books_url, notice: 'Book was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
  def set_book
    @book = Book.find(params[:id])
  end

  def  set_segment
      @segment = Segment.find(params[:segment_id])
  end
    # Only allow a list of trusted parameters through.
  def book_params
    params.require(:book).permit(:caption, :comment, :user_id, :segment_id)
  end
end
