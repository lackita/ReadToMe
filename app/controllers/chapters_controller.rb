class ChaptersController < ApplicationController
  # GET /chapters/new
  # GET /chapters/new.json
  def new
    @chapter = Chapter.new
    @chapter.book_id = params[:book_id]

    respond_to do |format|
      format.html # new.html.erb
      format.json { render :json => @chapter }
    end
  end

  # GET /chapters/1/edit
  def edit
    @chapter = Chapter.find(params[:id])
  end

  # POST /chapters
  # POST /chapters.json
  def create
    @chapter = Chapter.new(params[:chapter])

    if @chapter.book.status == 'Unread'
      @chapter.book.status = 'Reading'
      @chapter.book.save
    end

    respond_to do |format|
      if @chapter.save
        format.html { redirect_to @chapter.book, :notice => 'Chapter was successfully created.' }
        format.json { render :json => @chapter, :status => :created, :location => @chapter }
      else
        format.html { render :action => "new" }
        format.json { render :json => @chapter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /chapters/1
  # PUT /chapters/1.json
  def update
    @chapter = Chapter.find(params[:id])

    respond_to do |format|
      if @chapter.update_attributes(params[:chapter])
        format.html { redirect_to @chapter.book, :notice => 'Chapter was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render :action => "edit" }
        format.json { render :json => @chapter.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /chapters/1
  # DELETE /chapters/1.json
  def destroy
    @chapter = Chapter.find(params[:id])
    @chapter.destroy
    redirect_to @chapter.book
  end
end
