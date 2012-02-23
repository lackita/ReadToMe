class BooksController < ApplicationController
  # GET /books
  # GET /books.json
  def index
    if params.has_key?(:status)
      @current_status = params[:status]
    elsif session.has_key?(:recent_status)
      @current_status = session[:recent_status]
    else
      @current_status = 'Read'
    end
    session[:recent_status] = @current_status
    @statuses = %w{Unread Reading Read}
    @books = Hash.new()
    @statuses.each do |status|
      @books[status] = Book.find(:all, :order => "ordering", :conditions => {:status => status})
    end

    respond_to do |format|
      format.html # index.html.erb
      format.json { render :json => @books }
    end
  end

  # GET /books/1
  # GET /books/1.json
  def show
    @book = Book.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render :json => @book }
    end
  end

  # GET /books/new
  # GET /books/new.json
  def new
    @book = Book.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @book }
    end
  end

  # GET /books/1/edit
  def edit
    @book = Book.find(params[:id])
  end

  # POST /books
  # POST /books.json
  def create
    @book = Book.new(params[:book])
    @book.status = "Unread"

    respond_to do |format|
      if @book.save
        @book.ordering = @book.id
        @book.save
        format.html { redirect_to @book, :notice => 'Book was successfully created.' }
        format.json { render :json => @book, :status => :created, :location => @book }
      else
        format.html { render :action => "new" }
        format.json { render :json => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /books/1
  # PUT /books/1.json
  def update
    @book = Book.find(params[:id])
    if params[:book][:complete]
      params[:book].delete(:complete)
      @book.status = "Read"
    end

    respond_to do |format|
      if @book.update_attributes(params[:book])
        format.html { redirect_to @book, :notice => 'Book was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @book.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /books/1
  # DELETE /books/1.json
  def destroy
    @book = Book.find(params[:id])
    @book.destroy

    respond_to do |format|
      format.html { redirect_to books_url }
      format.json { head :ok }
    end
  end
end
